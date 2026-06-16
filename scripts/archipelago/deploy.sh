#!/bin/bash
echo -e "Deploying Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML Description block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/Object Description-bde1cb38-e1b8-4f2d-bc1c-bff646d2e8b7.json';

echo -e  "Linked Data Block HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/Linked Data-998d30c0-57b7-4219-bcff-6ac2c0bf6563.json';

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

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/Multiple Thumbnails via IIIF and FontAwesome-7ca9ef30-1535-4616-b3b2-201dcc7d6a69.json';

echo -e "AMI Ingest JSON Template\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/AMI Ingest JSON Template-8595827e-b17d-42bc-bc46-a746bdd05417.json';

echo -e "Simple Dublin Core XML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_12.json;

echo -e "IIIF 3.0 Canvases for Creative Work Series Children\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/IIIF Presentation API 3 Creative Works Series Child Canvases-d37a75ec-5da9-4374-b190-71385e630ded.json';

echo -e "IIIF 3.0 Manifest for Creative Work Series Parents\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/IIIF Presentation API 3 Creative Works Series Manifest-6c405928-9ae8-4557-b062-91fcf2b0af0a.json';

echo -e "IIIF 3.0 Manifest for Simple and Creative Work Series (Unified)\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/IIIF Presentation API 3 Series Manifest Unified-d4ca85ee-4ecd-40f3-ae6b-d24732863b27.json';

echo -e "IIIF 3.0 Collection Manifest for Collections, Newspapers and Serial Publications\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_15.json;

echo -e "IIIF 3.0 Thumbnail Manifest Snippet for Collections\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_16.json;

echo -e "OAI-PMH Wrapper\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/OAI-PMH Wrapper-7ed7f7b2-7690-402f-93ea-a9b50a094f30.json';

echo -e "OAI-PMH Item with DC\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_18.json;

echo -e "Thumbnails with Annotations for ML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @d8content/metadatadisplay_entity_19.json;

echo -e "AMI set Display \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/AMI Set Description-80a5d179-1689-4cdc-b21b-5a9461d86501.json';

echo -e "DataCite Schema V4 \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity --data-binary @'d8content/DataCite V4 Default Template for 1.6.0+-4003250e-a596-4c29-a7e3-d55ff1009d44.json';

echo -e "Deploying Menu Items\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_02.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_03.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_04.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_05.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_06.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_07.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_08.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_09.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/menu_link_content/menu_link_content --data-binary @d8content/menu_link_content_10.json;

echo -e "Adding your Demo AMI Set\n"
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity  --data-binary @d8content/ami_set_entity_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/octet-stream' -H 'Content-Disposition: file; filename="ami_set_entity_01.csv"' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768/source_data  --data-binary @d8content/ami_set_entity_01.csv;

echo -e "A welcome Message Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/block_content/block_with_twig_templating_ --data-binary @d8content/block_content_01.json;

echo -e "A Footer Block with cute icons\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/block_content/basic --data-binary @d8content/block_content_03.json;

echo -e "Advanced Search Page Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/block_content/block_with_twig_templating_ --data-binary @d8content/block_content_02.json;

echo -e "The Theme Mode Switcher Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPOST http://esmero-web/jsonapi/block_content/basic --data-binary @d8content/block_content_04.json;

echo -e "Last pass, setting web owner to tmp files folder and clearing Drupal Caches\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files

drush cr

echo -e  "Ready! Thanks for waiting."
