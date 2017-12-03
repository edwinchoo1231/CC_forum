<?php //session_start();

// variable declaration
$Student_Name = "";
$Student_Email    = "";
$Student_Course	= "";
$errors = array(); 
$_SESSION['success'] = "";

include "connect.php";
// connect to database
//$db = mysqli_connect('localhost:3306', 'root', '', 'cc_forum');

// REGISTER USER
if (isset($_POST['reg_user'])) {
	// receive all input values from the form
	$Student_Name = mysqli_real_escape_string($db, $_POST['Student_Name']);
	$Student_Email = mysqli_real_escape_string($db, $_POST['Student_Email']);
	$Student_Course = mysqli_real_escape_string($db, $_POST['Student_Course']);
	$Student_Password = mysqli_real_escape_string($db, $_POST['Student_Password']);
	$password_2 = mysqli_real_escape_string($db, $_POST['password_2']);

	// form validation: ensure that the form is correctly filled
	if (empty($Student_Name)) { array_push($errors, "Username is required"); }
	if (empty($Student_Email)) { array_push($errors, "Email is required"); }
	if (empty($Student_Course)) { array_push($errors, "Course is required"); }
	if (empty($Student_Password)) { array_push($errors, "Password is required"); }

	if ($Student_Password != $password_2) {
		array_push($errors, "The two passwords do not match");
	}

	$reg_date = date("Y-m-d");

	// register user if there are no errors in the form
	if (count($errors) == 0) {
		$password = md5($Student_Password);//encrypt the password before saving in the database
		$query = "INSERT INTO student (Student_Name, Student_Password, Student_Email,Student_RegDate, Student_Course) 
				  VALUES('$Student_Name', '$Student_Password', '$Student_Email', '$reg_date', '$Student_Course')";
		mysqli_query($db, $query);

		$_SESSION['Student_Name'] = $Student_Name;
		$_SESSION['success'] = "You are now logged in";
		header('location: index.php');
	}

}

// LOGIN USER
if (isset($_POST['login_user'])) {
	$Student_Name = mysqli_real_escape_string($db, $_POST['Student_Name']);
	$Student_Password = mysqli_real_escape_string($db, $_POST['Student_Password']);

	if (empty($Student_Name)) {
		array_push($errors, "Username is required");
	}
	if (empty($Student_Password)) {
		array_push($errors, "Password is required");
	}

	if (count($errors) == 0) {
		$password = md5($Student_Password);
		$query = "SELECT * FROM student WHERE Student_Name='$Student_Name' AND Student_Password='$Student_Password'";
		$results = mysqli_query($db, $query);

		if (mysqli_num_rows($results) == 1) {
			$_SESSION['Student_Name'] = $Student_Name;
			$_SESSION['success'] = "You are now logged in";
			header('location: index.php');
		}else {
			array_push($errors, "Wrong username/password combination");
		}
	}
}

?>
