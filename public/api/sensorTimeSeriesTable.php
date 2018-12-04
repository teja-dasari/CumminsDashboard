<?php
require '../../app/common.php';

$turbineId = intval($_GET['turbineId'] ?? 0);

if($turbineId < 1){
  $sensorTimeSeries = SensorTimeSeriesTable::fetchAll();
  $json = json_encode($sensorTimeSeries, JSON_PRETTY_PRINT);
  header('Content-type: application/json');
  echo $json;
}
else{
  $sensorTimeSeriesByTurbineId = SensorTimeSeriesTable::fetchTimeSeriesByTurbineId($turbineId);
    $json = json_encode($sensorTimeSeriesByTurbineId, JSON_PRETTY_PRINT);
    header('Content-Type: application/json');
    echo $json;
}
