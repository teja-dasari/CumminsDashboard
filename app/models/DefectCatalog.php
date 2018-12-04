<?php
class DefectCatalog
{
  public $defectID;
  public $productId;
  public $defectDate ;
  public $defectType;
  public $customerRating;
  public $actionTaken;

  public function __construct($data) {
    $this->customerId = isset($data['defectID']) ? intval($data['defectID']) : null;
    $this->productId = $data['productId'];
    $this->defectDate  = $data['defectDate '];
    $this->defectType = $data['defectType'];
    $this->defectDescription = $data['defectDescription'];
    $this->actionTaken= $data[' actionTaken'];
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
      $theClient =  new DefectCatalog($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
