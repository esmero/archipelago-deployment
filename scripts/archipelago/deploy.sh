#!/bin/bash
echo -e "Deploying Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_01.json;

echo -e  "Linked Data HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_02.json;

echo -e "IIIF 3.0 Manifest for books\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_03.json;

echo -e "Basic MODS 3.6 Caster\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_04.json;

echo -e "Last pass, setting web owner to tmp files folder\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files

echo -e  "Ready!"