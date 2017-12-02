<?php 
	session_start(); 

	if (isset($_POST['user_profile'])){
		header('location: user_profile.php');
	}

	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['Student_Name']);
		header("location: index.php");
	}
?>

<?php include "header.php"; ?>

	<div>
	  <h1>Categories: <br></h1>
	</div>

	<div>
	  <button onclick="engineering()"><a href="engineering.php">Engineering</a></button>
	</div>

	<div>
	  <button onclick="computer_science()"><a href="computer_science.php">Computer Science</a></button>
	</div>

	<div>
	  <button onclick="medical()"><a href="medical.php">Medical</a></button>
	</div>

	<div>
	  <button onclick="economy()"><a href="economy.php">Economy</a></button>
	</div>

	<div>
	  <button onclick="testing()"><a href="content.php?category='1'">Economy</a></button>
	</div>


<?php include "footer.php"; ?>