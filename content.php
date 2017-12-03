
<?php 
	session_start();
	include "server.php";
	include "header.php";
	$cat_name = "SELECT Cat_Name FROM categories";
	$result = mysqli_query($db, $cat_name);
	//$rows = mysqli_fetch_array($result);

	while($rows= mysqli_fetch_array($result)){
		if(isset($_GET[$rows['Cat_Name']]))
			echo '<h2>'.$rows['Cat_Name'].'</h2>';	
	}
	
	
?>
	<div>
		<form method="post" action="">
			Subject: <input type="text" name="Topic_Subject"><br>
			Content: <textarea name="Topic_Content"></textarea><br>
			<input type="submit" value="Create Topic">

		</form>
	</div>

<?php include "footer.php"; ?>