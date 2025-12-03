#!/bin/bash
echo "Adding Drupal 10 basic Configs"
chmod 755 /var/www/html/web/sites/default/settings.php
cat <<EOT >> /var/www/html/web/sites/default/settings.php
\$settings['config_sync_directory'] = '../config/sync';
\$settings['s3fs.access_key'] = 'minio';
\$settings['s3fs.secret_key'] = 'minio123';
\$settings['s3fs.upload_as_private'] = TRUE;
\$settings['file_private_path'] = '/var/www/html/private';
\$settings['webform_strawberryfield.europeana_entity_apikey'] = 'apidemo';
ini_set('memory_limit', '512M');
\$settings['install_profile'] = 'standard';
\$settings['class_loader_auto_detect'] = FALSE;
if (PHP_SAPI !== 'cli') {
  \$settings['reverse_proxy'] = TRUE;
  \$settings['reverse_proxy_addresses'] = [@\$_SERVER['REMOTE_ADDR']];
  # If Running Anubis via NGINX as Documented in this release, comment the Previous Line
  # and Uncomment The two Following Lines. Add/Replace Any Private IP Ranges under which your Docker Containers Run. 
  # The Values set there are the most common ones found for Docker Networks, but could be different if you customized it.
  #\$settings['reverse_proxy_addresses'] = ['10.0.0.0/8','192.168.0.0/16', '172.16.0.0/12'];
  #\$settings['reverse_proxy_trusted_headers'] = \\Symfony\\Component\\HttpFoundation\\Request::HEADER_X_FORWARDED_FOR | \\Symfony\\Component\\HttpFoundation\\Request::HEADER_X_FORWARDED_HOST | \\Symfony\\Component\\HttpFoundation\\Request::HEADER_X_FORWARDED_PORT | \\Symfony\\Component\\HttpFoundation\\Request::HEADER_X_FORWARDED_PROTO | \\Symfony\\Component\\HttpFoundation\\Request::HEADER_FORWARDED;
  
} else {
  \$settings['reverse_proxy'] = FALSE;
}
\$settings['hash_salt'] = 'CHANGE-ME';
EOT
echo "Please edit your web/sites/default/settings.php and change \$settings['hash_salt'] if going to public!"
echo "Updating your web root folder permissions."
chmod 0666 /var/www/html/web/sites/default/settings.php
chown -R www-data:www-data /var/www/html/web/sites
chown -R www-data:www-data /var/www/html/private
echo "Downloading JQUERY Slider Pips Library for facets"
mkdir -p /var/www/html/web/libraries/jquery-ui-slider-pips/dist
curl -o /var/www/html/web/libraries/jquery-ui-slider-pips/dist/jquery-ui-slider-pips.min.js 'https://raw.githubusercontent.com/simeydotme/jQuery-ui-Slider-Pips/v1.11.3/dist/jquery-ui-slider-pips.min.js'
curl -o /var/www/html/web/libraries/jquery-ui-slider-pips/dist/jquery-ui-slider-pips.min.css 'https://raw.githubusercontent.com/simeydotme/jQuery-ui-Slider-Pips/v1.11.3/dist/jquery-ui-slider-pips.min.css'
echo "Setting Git safe directories to permissive/docker"
git config --global --add safe.directory "*"
