<?php 
	session_start(); 
	$_SESSION['pages'] = "index";
	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['Student_Name']);
		header("location: index.php");
	}
?>
<?php include "server.php"; ?>
<?php include "header.php"; 
	
	$cat_name = "SELECT Cat_Name FROM categories";
	$result = mysqli_query($db, $cat_name); ?>

	<div>
	  <h1>Categories: <br></h1>
	</div>


	<div>
		<?php while($rows = mysqli_fetch_assoc($result)) {
			echo '<button><a href="content.php?'.$rows['Cat_Name'].'">' .  $rows['Cat_Name'] . '</a></button><br>';
            } ?>
	</div>



<?php include "footer.php"; ?>