<?php

$header = array('Host: api.content.market.yandex.ru', 'Accept: */*', 'Authorization: Pm8OHNBFM0qHcKECbLyqOlCnvfcr7N');
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://api.content.market.yandex.ru/v1/shop/98576/opinion.xml?count=30');
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
  curl_setopt($ch, CURLOPT_HEADER, false);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
$data = curl_exec($ch);
curl_close($ch);
header("Content-Type: text/xml");
$data = simplexml_load_string($data);
// $data = $data->opinion-list;
$d = $data->asXML();

print_r($d);