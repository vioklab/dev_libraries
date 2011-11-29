<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
 <head>
 <title>Ajax</title>
<script type="text/javascript">

var url = "getagents.php?whe=1&";

</script>
<script type="text/javascript" src="ajax.php"></script>
<link rel="stylesheet" href="css.css" type="text/css" />
</head>
<?
include("confarray.php");
?>
<body>

<script type="text/javascript">
getagents('<?=$muyarray[0][0];?>','');
</script>


<div id="hiddenDIV"></div>

</body>
</html>
