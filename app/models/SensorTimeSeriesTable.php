<?php
class SensorTimeSeriesTable
{
  public $sensorId;
  public $siteId;
  public $sensorDeployedId;
  public $dataCollectedDate;
  public $output;
  public $heatRate;
  public $compressorEfficiency;
  public $availability;
  public $reliability;
  public $firedHours;
  public $trips;
  public $starts;
  
  public function __construct($data) {
    $this->sensorDeployedId = isset($data['sensorDeployedId']) ? intval($data['sensorDeployedId']) : null;
    $this->sensorId = isset($data['sensorId']) ? intval($data['sensorId']) : null;
    $this->siteId = isset($data['siteId']) ? intval($data['siteId']) : null;
    $this->dataCollectedDate = $data['dataCollectedDate'];
    $this->output = $data['output'];
    $this->heatRate = $data['heatRate'];
    $this->compressorEfficiency = $data['compressorEfficiency'];
    $this->availability = $data['availability'];
    $this->reliability = $data['reliability'];
    $this->firedHours = $data['availability'];
    $this->trips = $data['trips'];
    $this->starts = $data['starts'];
  }
  
  public static function fetchAll() {
    // 1. Connect to the database
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);
    // 2. Prepare the query
    $sql = 'SELECT * FROM SensorTimeSeries';
    $statement = $db->prepare($sql);
    // 3. Run the query
    $success = $statement->execute();
    // 4. Handle the results
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
      $theSensorTimeSeries =  new SensorTimeSeriesTable($row);
      array_push($arr, $theSensorTimeSeries);
    }
    return $arr;
  }
  
  public static function fetchTimeSeriesByTurbineId(int $turbineId){
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);

   // 2. Prepare the query
   $sql = 'SELECT * from SensorTimeSeries sts inner join SensorDeployed sd on sts.sensorDeployedId = sd.sensorDeployedId inner join TurbineDeployed td on sd.TurbineDeployedId = td.TurbineDeployedId where turbineId = ?';
   //$sql = 'SELECT * FROM note WHERE clientId = ?';

   $statement = $db->prepare($sql);

   // 3. Run the query
   $success = $statement->execute(
       [$turbineId]
   );
    
   // 4. Handle the results
   $arr = [];
   while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
     // 4.a. For each row, make a new work object
     $sensorTimeSeriesItem =  new SensorTimeSeriesTable($row);
     array_push($arr, $sensorTimeSeriesItem);
   }
   return $arr;
  }
}
