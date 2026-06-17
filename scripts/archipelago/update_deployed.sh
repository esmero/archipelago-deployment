#!/bin/bash
echo -e "Updating Metadata Display entities or better known as Twig Templates:\n"

echo -e "General HTML Description block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/bde1cb38-e1b8-4f2d-bc1c-bff646d2e8b7 --data-binary @'d8content/Object Description-bde1cb38-e1b8-4f2d-bc1c-bff646d2e8b7.json';

echo -e  "Linked Data Block HTML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/998d30c0-57b7-4219-bcff-6ac2c0bf6563 --data-binary @'d8content/Linked Data-998d30c0-57b7-4219-bcff-6ac2c0bf6563.json';

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

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/7ca9ef30-1535-4616-b3b2-201dcc7d6a69 --data-binary @'d8content/Multiple Thumbnails via IIIF and FontAwesome-7ca9ef30-1535-4616-b3b2-201dcc7d6a69.json';

echo -e "AMI Ingest JSON Template\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/8595827e-b17d-42bc-bc46-a746bdd05417 --data-binary @'d8content/AMI Ingest JSON Template-8595827e-b17d-42bc-bc46-a746bdd05417.json';

echo -e "Simple Dublin Core XML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/e46fe78f-6b37-49a4-b277-1734c81fd847 --data-binary @d8content/metadatadisplay_entity_12.json;

echo -e "IIIF 3.0 Canvases for Creative Work Series Children\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/d37a75ec-5da9-4374-b190-71385e630ded --data-binary @'IIIF Presentation API 3 Creative Works Series Child Canvases-d37a75ec-5da9-4374-b190-71385e630ded.json';

echo -e "IIIF 3.0 Manifest for Creative Work Series Parents\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/6c405928-9ae8-4557-b062-91fcf2b0af0a --data-binary @'d8content/IIIF Presentation API 3 Creative Works Series Manifest-6c405928-9ae8-4557-b062-91fcf2b0af0a.json';

echo -e "IIIF 3.0 Manifest for Simple and Creative Work Series (Unified)\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/d4ca85ee-4ecd-40f3-ae6b-d24732863b27 --data-binary @'d8content/IIIF Presentation API 3 Series Manifest Unified-d4ca85ee-4ecd-40f3-ae6b-d24732863b27.json';

echo -e "IIIF 3.0 Collection Manifest for Collections, Newspapers and Serial Publications\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/9be8473c-3fb3-42ee-aef2-431b2d4f93bb --data-binary @d8content/metadatadisplay_entity_15.json;

echo -e "IIIF 3.0 Thumbnail Manifest Snippet for Collections\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/adf12524-11ca-4925-bc23-d028556e75ac --data-binary @d8content/metadatadisplay_entity_16.json;

echo -e "OAI-PMH Wrapper\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/7ed7f7b2-7690-402f-93ea-a9b50a094f30 --data-binary @'d8content/OAI-PMH Wrapper-7ed7f7b2-7690-402f-93ea-a9b50a094f30.json';

echo -e "OAI-PMH Item with DC\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/b5c12175-e0a9-49e9-a698-cbba342667e0 --data-binary @d8content/metadatadisplay_entity_18.json;

echo -e "Thumbnails with Annotations for ML\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/f13e8744-f6b2-46fc-8744-ef153e4c49f4 --data-binary @d8content/metadatadisplay_entity_19.json;

echo -e "AMI set Display \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/80a5d179-1689-4cdc-b21b-5a9461d86501 --data-binary @'d8content/AMI Set Description-80a5d179-1689-4cdc-b21b-5a9461d86501.json';

echo -e "DataCite Schema V4 \n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/metadatadisplay_entity/metadatadisplay_entity/4003250e-a596-4c29-a7e3-d55ff1009d44 --data-binary @'d8content/DataCite V4 Default Template for 1.6.0+-4003250e-a596-4c29-a7e3-d55ff1009d44.json';



echo -e "Updating Menu Items\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/a580dad6-5932-4f9d-bdaa-06b5563c386c --data-binary @d8content/menu_link_content_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/2c576406-2a37-4fb8-b988-cd6db1105084 --data-binary @d8content/menu_link_content_02.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/9085dade-61be-4581-ba00-239f16787d7f --data-binary @d8content/menu_link_content_03.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/b858da4a-e1fc-4bf3-a7b8-2e16fd21ccd9 --data-binary @d8content/menu_link_content_04.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/3756cd18-6387-4c37-9033-5045f6a4a525 --data-binary @d8content/menu_link_content_08.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/0faa6a44-e022-4320-9460-33b9fe3b8b01 --data-binary @d8content/menu_link_content_09.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/menu_link_content/menu_link_content/8f4390e9-5ded-4047-96ff-2446a540ec57 --data-binary @d8content/menu_link_content_10.json;


echo -e "Adding your Demo AMI Set\n"
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768  --data-binary @d8content/ami_set_entity_01.json;
curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/octet-stream' -H 'Content-Disposition: file; filename="ami_set_entity_01.csv"' -XPOST http://esmero-web/jsonapi/ami_set_entity/ami_set_entity/5e537ff6-3b84-4540-afef-94e5e81e4768/source_data  --data-binary @d8content/ami_set_entity_01.csv;

echo -e "A welcome message\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/block_content/block_with_twig_templating/1cdf7155-eb60-4f27-9e5e-64fffe93127a --data-binary @d8content/block_content_01.json;

echo -e "A Footer Block with cute icons\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/block_content/basic/3922a818-cb0d-438c-bdde-7761ff27cb19 --data-binary @d8content/block_content_03.json;

echo -e "Advanced Search Page Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/block_content/block_with_twig_templating/9aa72fb1-2817-44a7-8fb5-a3eb51166e83 --data-binary @d8content/block_content_02.json;

echo -e "The Theme Mode Switcher Block\n"

curl -w "\n" --user jsonapi:jsonapi -H 'Accept: application/vnd.api+json' -H 'Content-type: application/vnd.api+json' -XPATCH http://esmero-web/jsonapi/block_content/basic/18fa77c1-8f18-408a-b300-03fb05be8118 --data-binary @d8content/block_content_04.json;

echo -e "Last pass, setting web owner to tmp files folder and clearing Drupal caches\n"

chown -R www-data:www-data /var/www/html/web/sites/default/files
drush cr

echo -e  "Ready!"
