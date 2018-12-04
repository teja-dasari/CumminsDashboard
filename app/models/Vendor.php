<?php
class Vendor
{
  public $vendorId;
  public $vendorName;
  public $vendorDescription;
  public $vendorLocation;
  public $vendorRating;
  public $compliance

  public function __construct($data) {
    $this->vendorId = isset($data['vendorId']) ? intval($data['vendorId']) : null;
    $this->vendorName = $data['vendorName'];
    $this->vendorDescription = $data['vendorDescription'];
    $this->vendorLocation = $data['vendorLocation'];
    $this->vendorRating = $data['vendorRating'];
    $this->compliance = $data['compliance'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM Vendor';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new Vendor($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
