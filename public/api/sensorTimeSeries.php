<?php
require '../../app/common.php';

$sensorDeployedId = intval($_GET['sensorDeployedId'] ?? 0);

if($sensorDeployedId < 1){
  $sensorTimeSeries = SensorTimeSeries::fetchAll();
  $json = json_encode($sensorTimeSeries, JSON_PRETTY_PRINT);
  header('Content-type: application/json');
  echo $json;
}
else{
  $sensorTimeSeriesByTurbineId = SensorTimeSeries::fetchTimeSeriesByTurbineId($sensorDeployedId);
    $json = json_encode($sensorTimeSeriesByTurbineId, JSON_PRETTY_PRINT);
    header('Content-Type: application/json');
    echo $json;
}
