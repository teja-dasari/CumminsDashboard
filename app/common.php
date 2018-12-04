<?php
// Change the working directory to this file.
chdir(__DIR__);
set_include_path (__DIR__);
if ($_SERVER['REQUEST_METHOD'] == 'POST'
&& stripos($_SERVER['CONTENT_TYPE'], 'application/json') !== false ) {
  $_POST = json_decode(file_get_contents('php://input'), true);
}
require 'environment.php';
/** MODELS **/
require 'models/Client.php';
require 'models/Turbine.php';
require 'models/SensorDeployed.php';
require 'models/Site.php';
require 'models/SensorTimeSeries.php';
require 'models/Note.php';
require 'models/SensorTimeSeriesTable.php';

require 'models/Customer.php';
require 'models/Vendor.php';
require 'models/ProductData.php';
require 'models/PartsData.php';
require 'models/PartsOrderStatus.php';
require 'models/ProductsOrderStatus.php';
require 'models/ProductsOrderStatus.php';
require 'models/IOTData.php';
require 'models/DefectCatalog.php';
