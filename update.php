<?php

	//echo 2; //to deactivate app, uncomment this

	if(empty($_GET['u']))
	echo 0;

	else
	{

	$content = $_GET['u'];
	$val = $_GET['user']."@".$_GET['c'].".txt";
	
	if(empty($_GET['user']) || empty($_GET['c']))
	{
		$filename = "data.txt";
		$fp = fopen ($filename, "a");	
		$result = fwrite($fp, $val);
		$result = fwrite($fp, $content);
	}
	else
	{
		$filename = $val;
		$fp = fopen ($filename, "a");
		$result = fwrite($fp, $content);
	}
	fclose ($fp);

	if($result>0)
	echo 1;

	else
	echo 2;

	}

?>
<!--