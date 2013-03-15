<?php
// This file is the server-side script for logging in a user
// get the credentials from the POST
$username = $_POST['username'];
$password = $_POST['password'];
// User array. This would be returned by a call to a database using the supplied credentials.
/*
A Database call might look something like this:
$retval = -1;
mysql_connect(host, user, password);
mysql_select_db(database);
[db_query ...
	if (success) {
		$retval = (record_returned) ? 1 : 0;
	}
]
echo $retval;
mysql_close();
*/
// this assumes the database returned a record
$users = array(0 => array("userid" => "101", "username" => "isocket", "password" => "password"));
$pass = true;
//print_r($user);
if (trim($username) != $users[0]['username'] || trim($password) != $users[0]['password']) {
	$pass = false;
}
// return a JSON response
$result = array("result" => "$pass");
if ($pass) {
	$result['userid'] = $users[0]['userid'];
}
echo json_encode($result);

?>