<?php
$note = new Note($_POST);
$note->addNotes();
echo json_encode($note);
