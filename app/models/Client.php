<?php
class Client
{
  public $clientId;
  public $clientName;
  public $clientDescription;
  public $gicsSector;
  public $gicsSubIndustry;
  public $headquarters;

  public function __construct($data) {
    $this->clientId = isset($data['clientId']) ? intval($data['clientId']) : null;
    $this->clientName = $data['clientName'];
    $this->clientDescription = $data['clientDescription'];
    $this->gicsSector = $data['gicsSector'];
    $this->gicsSubIndustry = $data['gicsSubIndustry'];
    $this->headquarters = $data['headquarters'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM Client';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theClient =  new Client($row);
      array_push($arr, $theClient);
    }
    return $arr;
  }
}
