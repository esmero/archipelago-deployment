<?PHP

function arguments($argv) {
    $_ARG = array();
    foreach ($argv as $arg) {
      if (preg_match('/--([^=]+)=(.*)/',$arg,$reg)) {
        $_ARG[$reg[1]] = $reg[2];
      } elseif(preg_match('/-([a-zA-Z0-9])/',$arg,$reg)) {
            $_ARG[$reg[1]] = 'true';
        }

    }
  return $_ARG;
}

$arguments = arguments($argv);
print_r($arguments);
if (isset($arguments['url']) && isset($arguments['csv']) && isset($arguments['json']) && isset($arguments['user']) && isset($arguments['password'])) {

echo __DIR__;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $arguments['url'] .'source_data');
curl_setopt($ch, CURLOPT_USERPWD, $arguments['user'] . ":" . $arguments['password']);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE );
curl_setopt($ch, CURLOPT_POST,           TRUE );
curl_setopt($ch, CURLOPT_POSTFIELDS,     file_get_contents(__DIR__ . '/' . $arguments['csv']));
curl_setopt($ch, CURLOPT_HTTPHEADER,  ['Content-Type: application/octet-stream','Accept: application/vnd.api+json','Content-Disposition: file; filename="'.$arguments['csv'].'"']);

$result=curl_exec ($ch);
if (curl_errno($ch)) {
    print curl_error($ch);
}
else {
  $response = json_decode($result);
  $file_uuid = $response['data']['id'] ?? NULL;
    
}

curl_close($ch);
}
else {
print_r('Missing arguments');
}
