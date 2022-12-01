#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Use this script to import or export Metadata Display Twig Templates."
   echo
   echo "Syntax: ./import_export.sh [-h|n|i|e|j|d|s|k]"
   echo "options:"
   echo "h     Print this Help."
   echo "n     Interactive mode."
   echo "i     Import."
   echo "e     Export."
   echo "j     The absolute path of the .env file containing the JSON API user and password set as JSONAPI_USER and JSONAPI_PASSWORD."
   echo "d     The URL of the Archipelago instance to import into or export out of. Examples: https://archipelago.nyc | https://metro.org | http://localhost:8001"
   echo "s     The absolute path for the source from which to import or the target for exporting."
   echo "k     Keep the files that are in the folder, which would be deleted otherwise."
   echo "f     Simple JSON API Filter for the metadatadisplay entity to export, in the form of \"field name=value\". Be sure to urlencode the value if it contain spaces or special characters, e.g. -f \"name=New%20Custom%20Metadata%20Display\""
   echo
   echo "Examples:"
   echo
   echo "./import_export.sh -e -j /home/user/archipelago-deployment-live/deploy/ec2-docker/.env -d https://archipelago.nyc -s /home/user/metadata_export"
   echo
   echo "./import_export.sh -i -j /home/user/archipelago-deployment-live/deploy/ec2-docker/.env -d https://archipelago.nyc -s /home/user/metadata_import"
   echo
   echo "./import_export.sh -e -j /home/user/archipelago-deployment-live/deploy/ec2-docker/.env -d https://archipelago.nyc -s /home/user/metadata_export -f name=New%20Custom%20Metadata%20Display"
   echo
}

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
adl_env_file="$script_dir/../../../deploy/ec2-docker/.env"
ad_env_file="$script_dir/../../.env"
env_file=""
if [ -f "$adl_env_file" ]; then
  env_file="$adl_env_file"
elif [ -f "$ad_env_file" ]; then
  env_file="$ad_env_file"
fi
source "$env_file"
metadata_action_opts=("Export all Metadata Displays to a folder." "Import all Metadata Displays from a folder." "Cancel")
selected_metadata_action=""
archipelago_domain=""
archipelago_protocol="https://"
archipelago_url=""
archipelago_domain_set=false
json_api_endpoint=""

#noninteractive flags
action_set=false
jsonapi_set=false
url_set=false
source_target_set=false
keep_files=false

if [ -n "${ARCHIPELAGO_DOMAIN}" ]; then
  archipelago_domain="${ARCHIPELAGO_DOMAIN}"
  archipelago_url="$archipelago_protocol$archipelago_domain"
  json_api_endpoint="$archipelago_url/jsonapi/metadatadisplay_entity/metadatadisplay_entity"
  url_set=true
fi

if [ -n "${JSONAPI_USER}" ] && [ -n "${JSONAPI_PASSWORD}" ]; then
  username="${JSONAPI_USER}"
  password="${JSONAPI_PASSWORD}"
  jsonapi_set=true
fi

domain_questions() {
  if [ -n "${ARCHIPELAGO_DOMAIN}" ]; then
    echo "Is $archipelago_url the correct URL? "
    PS3='> '
    select opt in Yes No; do
      case "$opt" in
        Yes)
          archipelago_domain_set=true
          break;;
        No)
          archipelago_domain_set=false
          break;;
        *) echo "Please select an option.";;
      esac
    done
  fi
  if [ "$archipelago_domain_set" = false ]; then
    echo -n $'What is the URL? (including protocol and without trailing slash, e.g. https://metro.org or https://archipelago.nyc or http://localhost:8001)\n'
    read -p "> " archipelago_url
  fi
}

import_data() {
  [[ "${source_target}" != */ ]] && source_target="${source_target}/"
  shopt -s nullglob
 
  for f in $source_target*.json
  do
    import_id=$(jq -cr .data.id "$f")
    import_id_exists=$(curl -I -w "\n" --write-out '%{http_code}' --silent --output /dev/null -K - "$json_api_endpoint"/"$import_id" <<< "user = \"$username:$password\"")
    if [ $import_id_exists -eq 200 ]; then
      echo 'Metadata Display Entity exists. Updating.'
      curl -w "\n" -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH "$json_api_endpoint"/"$import_id" --data-binary @$f -K - "$json_api_endpoint"/"$import_id" <<< "user = \"$username:$password\"";
    else
      echo 'Metadata Display Entity exists. Importing.'
      curl -w "\n" -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST "$json_api_endpoint" --data-binary @"$f" -K - "$json_api_endpoint" <<< "user = \"$username:$password\"";
    fi
  done
}

export_data() {
  if [ ! -d "$source_target" ]; then
    mkdir -p "$source_target"
  elif [ "$keep_files" = false ]; then
    echo "Deleting *.json from $source_target"
    rm $source_target/*.json
  fi
  cd "$source_target" &&
  echo "Exporting Metadata Displays to $source_target"
  curl -w "\n" -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -K - "$json_api_endpoint" <<< "user = \"$username:$password\"" | jq -cr '.data[]|del(.links)|del(.relationships)|del(.attributes.created)|del(.attributes.drupal_internal__id)|del(.attributes.changed)|del(.attributes.link)|{"data": .}' | while read -r metadatadisplay_entity;
  do
    uuid=$(echo "$metadatadisplay_entity" | jq -r .data.id)
    echo "$metadatadisplay_entity" >> "metadatadisplay_entity_$uuid.json"
  done
}

interactive_prompts() {
  echo 'What would you like to do? '
  PS3='> '
  
  select opt in "${metadata_action_opts[@]}"; do
    case "$opt" in
      "Cancel")
        exit 0;;
      Export*)
        selected_metadata_action="export"
        break;;
      Import*)
        selected_metadata_action="import"
        break;;
      *) echo "Please select an option.";;
    esac
  done
  
  unset username
  unset password
  echo "JSON:API Username:"
  read -p "> " username
  prompt="JSON:API Password: `echo $'\n> '`"
  while IFS= read -p "$prompt" -r -s -n 1 char
  do
    if [[ "${char}" == $'\0' ]]; then
      break
    fi
    prompt='*'
    password+="$char"
  done
  echo $'\n'

  domain_questions
  
  json_api_endpoint="$archipelago_url/jsonapi/metadatadisplay_entity/metadatadisplay_entity"
  
  if [ "${selected_metadata_action}" == "export" ]; then
    source_target=""
    echo 'Export to the current directory? (Please note that any existing .json files will be deleted first.) '
    echo "$PWD"
    PS3='> '
    select opt in "Yes, export to current directory." "No, specify a directory."; do
      case "$opt" in
        Yes*)
          source_target="$PWD"
          break;;
        No*)
          echo "Please provide an absolute directory (will be created if it doesn't already exist): "
          read -p "> " source_target
          break;;
        *) echo "Please select an option.";;
      esac
    done
    export_data
 
  elif [ "${selected_metadata_action}" == "import" ]; then
    source_target=""
    echo 'Import from the current directory? '
    echo "$PWD"
    PS3='> '
    select opt in "Yes, import from current directory." "No, specify a directory."; do
      case "$opt" in
        Yes*)
          source_target=$PWD
          break;;
        No*)
          echo "Please provide an absolute directory: "
          read -p "> " source_target
          break;;
        *) echo "Please select an option.";;
      esac
    done
    import_data
  fi
}
while getopts ":hniekj:d:s:f:" option; do
  case $option in
    h) # Display Help
       Help
       exit;;
    n) # Interactive
       interactive_prompts
       exit;;
    i) # Import
       selected_metadata_action="import"
       action_set=true
       ;;
    e) # Export
       selected_metadata_action="export"
       action_set=true
       ;;
    j) # JSONAPI credentials
       env_file="$OPTARG"
       if [ -f "$env_file" ]; then
         source "$env_file"
       else
         echo "Invalid .env file."
         exit
       fi
       if [ -n "${JSONAPI_USER}" ] && [ -n "${JSONAPI_PASSWORD}" ]; then
         username="${JSONAPI_USER}"
	 password="${JSONAPI_PASSWORD}"
         jsonapi_set=true
       else
         echo "JSONAPI_USER and/or JSONAPI_PASSWORD are missing."
         exit
       fi
       ;;
    d) # URL
       archipelago_url="$OPTARG"
       json_api_endpoint="$archipelago_url/jsonapi/metadatadisplay_entity/metadatadisplay_entity"
       url_set=true
       ;;
    s) # Source/Target
       source_target="$OPTARG"
       source_target_set=true
       ;;
    k) # Keep files
       keep_files=true;;
    f) # JSON API Export Filter
       IFS=\= read -a json_api_filter <<<"$OPTARG"
       if [ ${#json_api_filter[*]} -ne 2 ];
       then
         unset json_api_filter
         echo "Error: Invalid JSON API Filter expression. It should be in the form of field=value (make sure that value is url-encoded)."
       else
         json_api_endpoint=${json_api_endpoint}?filter\\[${json_api_filter[0]}\\]=${json_api_filter[1]};
       fi
       ;;
   \?) # Invalid option
       echo "Error: Invalid option"
       exit;;
  esac
done

if [ "$action_set" = false ]; then
  echo "Please provide an action option. Run with the -h flag for help."
  exit
elif [ "$jsonapi_set" = false ]; then
  echo "Please set the JSONAPI user. Run with the -h flag for help."
  exit
elif [ "$url_set" = false ]; then
  echo "Please set the URL for import/export. Run with the -h flag for help."
elif [ "$source_target_set" = false ]; then
  echo "Please set the location to import/export. Run with the -h flag for help."
else
  if [ "$selected_metadata_action" == "import" ]; then
    import_data
  elif [ "$selected_metadata_action" == "export" ]; then
    export_data
  fi
fi
