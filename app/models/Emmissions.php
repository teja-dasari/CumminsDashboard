<?php
class IOTData
{
  public $emmissionId;
  public $product;
  public $numRfidTags;
  public $avgEmmission;
  public $epa;
  public $nhtsa;
  public $carb;

  public function __construct($data) {
    $this->emmissionId = isset($data['emmissionId']) ? intval($data['emmissionId']) : null;
    $this->product = $data['product'];
    $this->numRfidTags = $data['numRfidTags'];
    $this->avgEmmission = $data['avgEmmission'];
    $this->epa = $data['epa'];
    $this->nhtsa = $data['nhtsa'];
    $this->carb = $data['carb'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM emmissions';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new Emmissions($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
