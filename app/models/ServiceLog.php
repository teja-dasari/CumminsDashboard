<?php
class IOTData
{
  public $rfidId;
  public $rfid;
  public $status;
  public $lastServiceDate;
  public $lastServiceDescription;

  public function __construct($data) {
    $this->rfidId = isset($data['rfidId']) ? intval($data['rfidId']) : null;
    $this->rfid = $data['rfid'];
    $this->status = $data['status'];
    $this->lastServiceDate = $data['lastServiceDate'];
    $this->lastServiceDescription = $data['lastServiceDescription'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM serviceLog';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new ServiceLog($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
