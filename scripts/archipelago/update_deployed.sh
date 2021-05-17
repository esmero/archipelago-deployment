#!/bin/bash
echo -e "Updating Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML Description block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/bde1cb38-e1b8-4f2d-bc1c-bff646d2e8b7 --data-binary @d8content/metadatadisplay_entity_01.json;

echo -e  "Linked Data Block HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/998d30c0-57b7-4219-bcff-6ac2c0bf6563 --data-binary @d8content/metadatadisplay_entity_02.json;

echo -e "IIIF 3.0 Manifest for Mirador\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/ad7aab5a-4bb3-43f2-8328-2b62895a3821 --data-binary @d8content/metadatadisplay_entity_03.json;

echo -e "MODS 3.7\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/4dff9ccc-e455-4cc9-ab73-922d44b971ab --data-binary @d8content/metadatadisplay_entity_04.json;

echo -e "IIIF 2.1 Manifest for Books\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/05fe574d-7534-4261-b49b-895b94ac3fce --data-binary @d8content/metadatadisplay_entity_05.json;

echo -e "GeoJSON for Maps\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/2b4f4fee-7202-4bc3-bae0-2a6d2d134c4b --data-binary @d8content/metadatadisplay_entity_06.json;

echo -e "A Bootstrap Carousel template from IIIF images and Views \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/df5a93ae-20e0-490f-a212-1b9e8ed3670f --data-binary @d8content/metadatadisplay_entity_07.json;

echo -e "General HTML Description block for Search Results\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/0ccc85b4-ed72-4c58-b585-ba652ebcfcaf --data-binary @d8content/metadatadisplay_entity_08.json;

echo -e "Basic Schema.org\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/509ff401-1a6b-47b2-96e2-ba1fa36f8182 --data-binary @d8content/metadatadisplay_entity_09.json;

echo -e "Multiple Thumbnails via IIIF and FontAwesome\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/7ca9ef30-1535-4616-b3b2-201dcc7d6a69 --data-binary @d8content/metadatadisplay_entity_10.json;

echo -e "AMI Ingest JSON Template\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/8595827e-b17d-42bc-bc46-a746bdd05417 --data-binary @d8content/metadatadisplay_entity_11.json;

echo -e "Simple Dublin Core XML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/e46fe78f-6b37-49a4-b277-1734c81fd847 --data-binary @d8content/metadatadisplay_entity_12.json;

echo -e "IIIF 3.0 Canvases for Creative Work Series Children\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/d37a75ec-5da9-4374-b190-71385e630ded --data-binary @d8content/metadatadisplay_entity_13.json;

echo -e "IIIF 3.0 Manifest for Creative Work Series Parents\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/6c405928-9ae8-4557-b062-91fcf2b0af0a --data-binary @d8content/metadatadisplay_entity_14.json;

echo -e "IIIF 3.0 Collection Manifest for Collections, Newspapers and Serial Publications\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/9be8473c-3fb3-42ee-aef2-431b2d4f93bb --data-binary @d8content/metadatadisplay_entity_15.json;

echo -e "IIIF 3.0 Thumbnail Manifest Snippet for Collections\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/adf12524-11ca-4925-bc23-d028556e75ac --data-binary @d8content/metadatadisplay_entity_16.json;

echo -e "Updating Menu Items\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/a580dad6-5932-4f9d-bdaa-06b5563c386c --data-binary @d8content/menu_link_content_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/2c576406-2a37-4fb8-b988-cd6db1105084 --data-binary @d8content/menu_link_content_02.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/9085dade-61be-4581-ba00-239f16787d7f --data-binary @d8content/menu_link_content_03.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/b858da4a-e1fc-4bf3-a7b8-2e16fd21ccd9 --data-binary @d8content/menu_link_content_04.json;

echo -e "Adding your Demo AMI Set\n"
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768  --data-binary @d8content/ami_set_entity_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/octet-stream' -H 'Content-Disposition: file; filename="ami_set_entity_01.csv"' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768/source_data  --data-binary @d8content/ami_set_entity_01.csv;

echo -e "A welcome message\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/block_content/block_with_twig_templating_/1cdf7155-eb60-4f27-9e5e-64fffe93127a --data-binary @d8content/block_content_01.json;

echo -e "Last pass, setting web owner to tmp files folder and clearing Drupal caches\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files
drush cr

echo -e  "Ready!"
