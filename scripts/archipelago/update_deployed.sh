#!/bin/bash
echo -e "Updating Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML Description block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/bde1cb38-e1b8-4f2d-bc1c-bff646d2e8b7 --data-binary @d8content/metadatadisplay_entity_01.json;

echo -e  "Linked Data Block HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/998d30c0-57b7-4219-bcff-6ac2c0bf6563 --data-binary @d8content/metadatadisplay_entity_02.json;

echo -e "IIIF 3.0 Manifest for Mirador\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/ad7aab5a-4bb3-43f2-8328-2b62895a3821 --data-binary @d8content/metadatadisplay_entity_03.json;

echo -e "Basic MODS 3.6 Caster\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/4dff9ccc-e455-4cc9-ab73-922d44b971ab --data-binary @d8content/metadatadisplay_entity_04.json;

echo -e "IIIF 2.1 Manifest for Books\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/05fe574d-7534-4261-b49b-895b94ac3fce --data-binary @d8content/metadatadisplay_entity_05.json;

echo -e "Last pass, setting web owner to tmp files folder\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files

echo -e  "Ready!"
