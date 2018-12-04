<?php
class PartsOrderStatus
{
  public $paOrderId;
  public $partsId;
  public $paOrderStatus;
  public $vendorId;
  public $purchaseAmount;

  public function __construct($data) {
    $this->paOrderId = isset($data['paOrderId']) ? intval($data['paOrderId']) : null;
    $this->partsId = $data['partsId'];
    $this->paOrderStatus = $data['paOrderStatus'];
    $this->vendorId = $data['vendorId'];
    $this->purchaseAmount = $data['purchaseAmount'];
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
      $theClient =  new PartsOrderStatus($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
