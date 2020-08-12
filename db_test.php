<?php

$serverName = getenv('DB_HOST'); //serverName\instanceName
$connectionInfo = array( 
                "Database"=> getenv('DB_DATABASE'), 
                "UID"=>getenv('DB_USERNAME'), 
                "PWD"=>getenv('DB_PASSWORD'));
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
     echo "Connection established.<br />";
}else{
     echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}






