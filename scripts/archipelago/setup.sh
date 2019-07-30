#!/bin/bash
echo "Adding Drupal 8 basic Configs"
cat <<EOT >> /var/www/html/web/sites/default/settings.php
\$settings['s3fs.access_key'] = 'minio';
\$settings['s3fs.secret_key'] = 'minio123';
\$settings['file_private_path'] = '/var/www/html/private';
ini_set('memory_limit', '512M');
\$settings['install_profile'] = 'standard';
if (PHP_SAPI !== 'cli') {
  \$settings['reverse_proxy'] = TRUE;
  \$settings['reverse_proxy_addresses'] = [@\$_SERVER['REMOTE_ADDR']];
} else {
  \$settings['reverse_proxy'] = FALSE;
}
EOT
echo "Downloading JQUERY Slider Pips Library for facets" 
mkdir -p /var/www/html/web/libraries/jquery-ui-slider-pips/dist
curl -o /var/www/html/web/libraries/jquery-ui-slider-pips/dist/jquery-ui-slider-pips.min.js 'https://raw.githubusercontent.com/simeydotme/jQuery-ui-Slider-Pips/v1.11.3/dist/jquery-ui-slider-pips.min.js' 
curl -o /var/www/html/web/libraries/jquery-ui-slider-pips/dist/jquery-ui-slider-pips.min.css 'https://raw.githubusercontent.com/simeydotme/jQuery-ui-Slider-Pips/v1.11.3/dist/jquery-ui-slider-pips.min.css' 
