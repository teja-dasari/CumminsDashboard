<?php
class IOTData
{
  public $productId;
  public $productName;
  public $fuelConsumption;
  public $oilStatus;
  public $batteryStatus;
  public $engineStatus;
  public $defectType;
  public $defectID;

  public function __construct($data) {
    $this->productId = isset($data['productId']) ? intval($data['productId']) : null;
    $this->productName = $data['productName'];
    $this->fuelConsumption = $data['fuelConsumption'];
    $this->oilStatus = $data['oilStatus'];
    $this->batteryStatus = $data['batteryStatus'];
    $this->engineStatus = $data['engineStatus'];
    $this->defectType = $data['defectType'];
    $this->defectID = $data['defectID'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM IOTData';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new IOTData($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
