<!DOCTYPE html>
<head>
    <title>CC_Forum</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div>
		<a href="index.php">Forum</a>
	</div>

	<div>
		<?php if ($_SESSION['pages']=="create_topic"):?>
		<p>GOOODDD</p>
		<?php endif ?>
		<?php if ($_SESSION['pages']!="create_topic"):?>
		<a href="create_topic.php">Create a Topic</a>
		<?php endif ?>
	</div>

	<div>
		<?php  if (isset($_SESSION['Student_Name'])) : ?>
			<button name="user_profile"><a href="user_profile.php"><strong><?php echo $_SESSION['Student_Name']; ?></strong></a></button>

		<?php endif ?>
		<?php  if (!isset($_SESSION['Student_Name'])) : ?>
			<button id="myBtn">Log in/Register</button>
		<?php endif ?>
		
	</div>
	  
	<div class="topnav">
	  	<input type="text" placeholder="Search..">
	  	<button onclick="Search_function()">Go</button>
	</div>

	<div>
	  <img src="CC_legend_KS.jpeg" alt="UPM Legendary Paladins player">
	</div>
<!--<?php //include "header.php"; ?>
	<?php //include "footer.php"; ?> -->
