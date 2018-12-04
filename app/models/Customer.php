<?php
class Customer
{
  public $customerId;
  public $customerName;
  public $customerDescription;
  public $customerLocation;
  public $customerRating;

  public function __construct($data) {
    $this->customerId = isset($data['customerId']) ? intval($data['customerId']) : null;
    $this->customerName = $data['customerName'];
    $this->customerDescription = $data['customerDescription'];
    $this->customerLocation = $data['customerLocation'];
    $this->customerRating = $data['customerRating'];
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
      $theClient =  new Customer($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
