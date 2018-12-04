<?php
class Site
{
  public $siteId;
  public $clientId;
  public $siteName;
  public $siteDescription;
  public $primaryContact;
  public $capacity;
  public $commercialDate;
  public $addrLine1;
  public $addrLine2;
  public $addrCity;
  public $addrState;
  public $addrZip;
  public $addrCountry;
  public $imgPath;

  public function __construct($data) {
    $this->siteId = isset($data['siteId']) ? intval($data['siteId']) : null;
    $this->clientId = $data['clientId'];
    $this->siteName = $data['siteName'];
    $this->siteDescription = $data['siteDescription'];
    $this->primaryContact = $data['primaryContact'];
    $this->capacity = $data['capacity'];
    $this->commercialDate = $data['commercialDate'];
    $this->addrLine1 = $data['addrLine1'];
    $this->addrLine2 = $data['addrLine2'];
    $this->addrCity = $data['addrCity'];
    $this->addrState = $data['addrState'];
    $this->addrZip = $data['addrZip'];
    $this->addrCountry = $data['addrCountry'];
    $this->imgPath = $data['imgPath'];
  }
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM Site';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theSite =  new Site($row);
      array_push($arr, $theSite);
    }
    return $arr;
  }
  public function create() {
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    $sql = 'INSERT Site (siteId, clientId, siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState,addrZip,addrCountry,imgPath)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?. ?, ?,?)';
    $statement = $db->prepare($sql);
    $success = $statement->execute([
      $this->siteId,
      $this->clientId,
      $this->siteName,
      $this->siteDescription,
      $this->primaryContact,
      $this->capacity,
      $this->commercialDate,
      $this->addrLine1,
      $this->addrLine2,
      $this->addrCity,
      $this->addrState,
      $this->addrZip,
      $this->addrCountry,
      $this->imgPath
    ]);
    $this->siteId = $db->lastInsertId();
  }
}
