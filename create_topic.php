<?php 
session_start();
include "server.php";
$_SESSION['pages'] = "create_topic";
include 'header.php';
	
	$cat_name = "SELECT Cat_Name FROM categories";
	$result = mysqli_query($db, $cat_name);
	//$rows = mysqli_fetch_array($result);?>

	<div>
		<h2><strong>Create a topic:<br></strong></h2>
	</div>
	
	<div>
		<form method="post">
		<button>Categories
			<select name="categories" onclick="enter">
				<option value="">Select...</option>
				<?php while($rows = mysqli_fetch_assoc($result)) {
					echo '<option value="">' .  $rows['Cat_Name'] . '</option>';
                    } ?>
			</select>
		</button>
		</form>
	</div>


<?php include 'footer.php'; ?>