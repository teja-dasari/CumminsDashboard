<?php
$site = new Site($_POST);
$site->create();
echo json_encode($site);
