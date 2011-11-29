
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>daftar anggota</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	font-weight: bold;
}
body {
	background-image: url(image542.gif);
}
.style2 {font-size: 36px}
-->
</style>
<?
	require_once('mysqllistdata.php');
?>
</head>

<body>

<div align="center">
  <p class="style1 style2">DATA ANGGOTA</p>
  <p class="style1">&nbsp;</p>
  <p class="style1">&nbsp;</p>
  <p>    

<?
		

$grid	= new	mySqlDataList	(	'M a s t e r    A n g g o t a    P e r p u s t a k a a n',
					array('id','nama','alamat','rt','rw'),
					'm_anggota',
					'id like "%" order by id asc',
					array('No Id','Member Name','Address','reg_id_1','reg_id_2'),
					array('center','left','left','center','center'),
					0,
					12,
					'sample1.php',
					array(3,30,40,3,3),
					1
				);
													
				
				$grid->set_mode(1);
				$grid->table_width	=	400;
				$grid->setdatanum(5);
				$grid->show();


		?>	
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="footer.gif" width="522" height="67"></p>
</div>
</body>
</html>
