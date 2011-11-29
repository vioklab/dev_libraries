<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Document sans nom</title>
<style type="text/css">
<!--
.bigtitle {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #990000;
}
.normal {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: normal;
	color: #502727;
}
.size12 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.border{
border-color:#990000;
border-style:dashed;
border-width:1px;
padding:20px;
margin :20px;
background-color:#FCF8F8;

}
.iframe{
 border: none ;
    overflow: hidden ;




}
-->
</style>
</head>

<body>
<p class="bigtitle">Google Site Map Generator V2.0<br>
Alban DOUSSAU<br>
<a href="http://www.dodecagone.com">http://www.dodecagone.com
</a></p>
<p class="normal"> This class can generate, display or write an XML Google Site Map file.<br>
This class is easy to use because she is able to determine the format of the input data automatically!<br>
After that, this class convert them to generate properly the XML.</p>
<p class="bigtitle">Google Sitemap Format  ..................</p>
<p class="normal">Please visit this page for more info on the Google Site Map Format : <a href="http://www.google.com/webmasters/sitemaps/docs/en/protocol.html" target="_blank">http://www.google.com/webmasters/sitemaps/docs/en/protocol.html</a></p>
<p class="bigtitle">Usage ............................................</p>
<p class="bigtitle">First you need to link my class files :</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/config/config.php";
			highlight_file($file);
			?> 
		</span>
	</div>
<p class="bigtitle">Sample 1 - Add a simple string url :</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/string.php";
			highlight_file($file);
			?> 
		</span>
	</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/string.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 2 - Add array of string url :</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/array.php";
			highlight_file($file);
			?> 
		</span>
	</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/array.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 3 - Add associative array of string url :</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/array_asso.php";
			highlight_file($file);
			?> 
		</span>
	</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/array_asso.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 4 - Add associative array of string url with full argument:</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/array_asso_full.php";
			highlight_file($file);
			?> 
		</span>
	</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/array_asso_full.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 5 - Add a folder with extra parameters:</p>
	<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/folder.php";
			highlight_file($file);
			?> 
		</span>
	</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/folder.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 6 - Add a mysql recordset </p>
<p class="size12">WARNING !!!! YOU MUST IMPORT <a href="sample_files/config/sql_sample.sql">sql_sample.sql</a> TO TEST THIS SAMPLE</p>
<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/mysql.php";
			highlight_file($file);
			?> 
		</span>
</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/mysql.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 7 - Mixed add </p>
<div class="border">
		<span class="size12">
			<?php
			$file="sample_files/mixed.php";
			highlight_file($file);
			?> 
		</span>
</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sample_files/mixed.php"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
<p class="bigtitle">Sample 8 - Mixed add and save to a file </p>
<div class="border">
		<span class="size12">
			<?php
			require_once "sample_files/mixed_save.php";
			$file="sample_files/mixed_save.php";
			highlight_file($file);
			?> 
		</span>
</div>
	<span class="bigtitle">Result:
    </span>
	<div class="border">
	  <IFRAME SRC="sitemap.xml"  HEIGHT="250" WIDTH="100%" class="iframe" frameborder="0" ></IFRAME>
	</div>
</body>
</html>
