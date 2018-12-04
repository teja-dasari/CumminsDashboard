<?php
class PartsData
{
  public $partsId;
  public $partsName;
  public $vendorId;
  public $vendorName;
  public $LastpaOrderId;

  public function __construct($data) {
    $this->partsId = isset($data['partsId']) ? intval($data['partsId']) : null;
    $this->partsName = $data['partsName'];
    $this->vendorId = $data['vendorId'];
    $this->vendorName = $data['vendorName'];
    $this->LastpaOrderId = $data['LastpaOrderId'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM Customer';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new PartsData($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
