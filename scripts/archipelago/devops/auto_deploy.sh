#!/bin/bash

# For archipelago-deployment 1.0.0

docker_files=( docker-compose-*.yml )
docker_files+=("Cancel")
debug_opts=("Yes, debugging" "No, not debugging" "Cancel")
content_opts=("Start with basic templates and demo content" "Blank deployment" "Cancel")
selected_docker_file=""
selected_debug=""
selected_start_with_content=""

PS3="Select a docker-compose file to use: "

select opt in "${docker_files[@]}"; do
  case "$opt" in
    "Cancel")
      exit 0;;
    docker-compose-*.yml)
      selected_docker_file="$opt"
      break;;
    *) echo "Please select a docker-compose file option";;
  esac

done

PS3="Will you be debugging? "

select opt in "${debug_opts[@]}"; do
  case "$opt" in
    "Cancel")
      exit 0;;
    Yes*debug*)
      selected_debug=1
      break;;
    No*debug*)
      selected_debug=0
      break;;
    *) echo "Please select a debugging option";;
  esac
done

PS3="Would you like to start with a blank deployment or with basic templates and a demo AMI set? "

select opt in "${content_opts[@]}"; do
  case "$opt" in
    "Cancel")
      exit 0;;
    Start*)
      selected_start_with_content=1
      break;;
    Blank*)
      selected_start_with_content=0
      break;;
    *) echo "Please select a base content option";;
  esac
done

if [ $selected_debug -eq 1 ] && [ "$selected_docker_file" == *linux* ]
then
  sed -i 's/^;xdebug\.discover_client_host=1$/xdebug\.discover_client_host=1/' xdebug/xdebug.ini
  sed -i 's/^xdebug.client_host=host\.docker\.internal$/;xdebug\.client_host=host\.docker\.internal/' xdebug/xdebug.ini
fi

cp "$selected_docker_file" docker-compose.yml &&
[ $selected_debug -eq 1 ] &&
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d ||
docker-compose up -d &&
sudo chown -R 8183:8183 persistent/iiifcache &&
sudo chown -R 8983:8983 persistent/solrcore &&
until [ "`docker inspect -f {{.State.Running}} esmero-minio`"=="true" ]; do
    sleep 0.1;
done;
esmero_network=$(docker network ls --filter name=esmero-net --format "{{.Name}}")
host_network=$(docker network ls --filter name=host-net --format "{{.Name}}")
docker run -d --name esmero-mc --network="$esmero_network" -it --entrypoint sh minio/mc &&
docker network connect "$host_network" esmero-mc &&
docker exec -ti esmero-mc bash -c "mc config host add esmero-minio http://esmero-minio:9000 minio minio123 && mc mb esmero-minio/archipelago" &&
docker stop esmero-mc &&
docker rm esmero-mc &&
docker exec -ti esmero-php bash -c "chown -R www-data:www-data private" &&
docker exec -ti esmero-php bash -c "composer install" &&
docker exec -ti esmero-php bash -c 'scripts/archipelago/setup.sh' &&
docker exec -ti -u www-data esmero-php bash -c "cd web;../vendor/bin/drush -y si --verbose --existing-config --db-url=mysql://root:esmerodb@esmero-db/drupal --account-name=admin --account-pass=archipelago -r=/var/www/html/web --sites-subdir=default --notify=false;drush cr;chown -R www-data:www-data sites;" &&
docker exec -ti esmero-php bash -c 'drush ucrt demo --password="demo"; drush urol metadata_pro "demo"' &&
docker exec -ti esmero-php bash -c 'drush ucrt jsonapi --password="jsonapi"; drush urol metadata_api "jsonapi"' &&
docker exec -ti esmero-php bash -c 'drush urol administrator "admin"' &&
[ $selected_start_with_content -eq 1 ] &&
docker exec -ti esmero-php bash -c 'scripts/archipelago/deploy.sh' ||
: &&
echo -e "Enjoy your Archipelago! You can log in by going to http://localhost:8001 with the following credentials.\n\n    user: admin\npassword: archipelago\n"
