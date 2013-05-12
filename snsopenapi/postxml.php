<?php
$xml_data ='<AATAvailReq1>'.
'<Agency>'.
'<Iata>1234567890</Iata>'.
'<Agent>lgsoftwares</Agent>'.
'<Password>mypassword</Password>'.
'<Brand>phpmind.com</Brand>'.
'</Agency>'.
'<Passengers>'.
'<Adult AGE="" ID="1"></Adult>'.
'<Adult AGE="" ID="2"></Adult>'.
'</Passengers>'.
'<HotelAvailReq1>'.
'<DestCode>JHM</DestCode>'.
'<HotelCode>OGGSHE</HotelCode>'.
'<CheckInDate>101009</CheckInDate>'.
'<CheckOutDate>101509</CheckOutDate>'.
'<UseField>1</UseField>'.
'</HotelAvailReq1>'.
'</AATAvailReq1>';
$URL = "https://www.yourwebserver.com/path/";
$ch = curl_init($URL);
curl_setopt($ch, CURLOPT_MUTE, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: text/xml'));
curl_setopt($ch, CURLOPT_POSTFIELDS, "$xml_data");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$output = curl_exec($ch);
curl_close($ch);
?>