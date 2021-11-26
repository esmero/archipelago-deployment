#!/bin/bash
echo -e "Deploying Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML Description block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_01.json;

echo -e  "Linked Data Block HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_02.json;

echo -e "IIIF 3.0 Manifest for Images and Mirador\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_03.json;

echo -e "MODS 3.7\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_04.json;

echo -e "IIIF 2.1 Manifest for Images and Books\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_05.json;

echo -e "GeoJSON for Maps\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_06.json;

echo -e "A Bootstrap Carousel template from IIIF images and Views \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_07.json;

echo -e "General HTML Description block for Search Results\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_08.json;

echo -e "Basic Schema.org\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_09.json;

echo -e "Multiple Thumbnails via IIIF and FontAwesome\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_10.json;

echo -e "AMI Ingest JSON Template\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_11.json;

echo -e "Simple Dublin Core XML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_12.json;

echo -e "IIIF 3.0 Canvases for Creative Work Series Children\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_13.json;

echo -e "IIIF 3.0 Manifest for Creative Work Series Parents\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_14.json;

echo -e "IIIF 3.0 Collection Manifest for Collections, Newspapers and Serial Publications\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_15.json;

echo -e "IIIF 3.0 Thumbnail Manifest Snippet for Collections\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_16.json;

echo -e "Deploying Menu Items\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_02.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_03.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_04.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_05.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_06.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_07.json;

echo -e "Adding your Demo AMI Set\n"
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity  --data-binary @d8content/ami_set_entity_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/octet-stream' -H 'Content-Disposition: file; filename="ami_set_entity_01.csv"' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768/source_data  --data-binary @d8content/ami_set_entity_01.csv;

echo -e "A welcome Message Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/block_content/block_with_twig_templating_ --data-binary @d8content/block_content_01.json;

echo -e "Last pass, setting web owner to tmp files folder and clearing Drupal Caches\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files

drush cr

echo -e  "Ready! Thanks for waiting."
