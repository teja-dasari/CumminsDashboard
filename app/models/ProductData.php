<?php
class ProductData
{
  public $productId;
  public $productName;
  public $productType;
  public $customerName;
  public $customerId;
  public $LastprOrderId;

  public function __construct($data) {
    $this->productId = isset($data['productId']) ? intval($data['productId']) : null;
    $this->productName = $data['productName'];
    $this->productType = $data['productType'];
    $this->customerName = $data['customerName'];
    $this->LastprOrderId = $data['LastprOrderId'];
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
      $theClient =  new ProductData($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
