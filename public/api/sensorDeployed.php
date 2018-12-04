<?php
require '../../app/common.php';

$turbineId = intval($_GET['turbineId'] ?? 0);

if($turbineId < 1){
  echo 'Hello World';
}
else{
  $sensorDelpoyedByTurbineId = SensorDeployed::fetchSensorByTurbine($turbineId);
    $json = json_encode($sensorDelpoyedByTurbineId, JSON_PRETTY_PRINT);
    header('Content-Type: application/json');
    echo $json;
}
