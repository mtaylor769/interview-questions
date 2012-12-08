<?php

$USERNAME = 'isocket';
$PASSWORD = 'rocks!';
$data = array();

if ($_POST && isset($_POST['username']) && isset($_POST['passwd'])) {
  if ($_POST['username'] == $USERNAME && $_POST['passwd'] == $PASSWORD) {
    $data['success'] = TRUE;
  } else {

    $data['errors'] = array();

    if ($_POST['username'] != $USERNAME) {
      array_push($data['errors'], 'username');
    }

    if ($_POST['passwd'] != $PASSWORD) {
      array_push($data['errors'], 'passwd');
    }
  }

  echo json_encode($data);
}