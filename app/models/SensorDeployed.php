<?php
class SensorDeployed
{
  public $sensorDeployedId;

  public function __construct($data) {
    $this->sensorDeployedId = isset($data['sensorDeployedId']) ? intval($data['sensorDeployedId']) : null;
  }

  public static function fetchSensorByTurbine(int $turbineId) {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT sensorDeployedId FROM SensorDeployed sd, TurbineDeployed td where sd.turbineDeployedId = td.turbineDeployedId and td.turbineId = ?';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute(
       [$turbineId]
    );
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theSensor =  new SensorDeployed($row);
      array_push($arr, $theSensor);
    }
    return $arr;
  }
}
