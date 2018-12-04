<?php
class Turbine
{
  public $turbineId;
  public $turbineName;
  public $turbineDescription;
  public $capacity;
  public $rampUpTime;
  public $maintenanceInterval;

  public function __construct($data) {
    $this->turbineId = isset($data['turbineId']) ? intval($data['turbineId']) : null;
    $this->turbineName = $data['turbineName'];
    $this->turbineDescription = $data['turbineDescription'];
    $this->capacity = isset($data['capacity']) ? intval($data['capacity']) : null;
    $this->rampUpTime = isset($data['rampUpTime']) ? intval($data['rampUpTime']) : null;
    $this->maintenanceInterval = isset($data['maintenanceInterval']) ? intval($data['maintenanceInterval']) : null;
  }

  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM Turbine';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theTurbine =  new Turbine($row);
      array_push($arr, $theTurbine);
    }
    return $arr;
  }
}
