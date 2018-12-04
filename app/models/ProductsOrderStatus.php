<?php
class ProductsOrderStatus
{
  public $prOrderId;
  public $productId;
  public $prOrderStatus;
  public $customerId;
  public $purchaseAmount;

  public function __construct($data) {
    $this->prOrderId = isset($data['prOrderId']) ? intval($data['prOrderId']) : null;
    $this->productId = $data['productId'];
    $this->prOrderStatus = $data['prOrderStatus'];
    $this->customerId = $data['customerId'];
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
      $theClient =  new ProductsOrderStatus($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
