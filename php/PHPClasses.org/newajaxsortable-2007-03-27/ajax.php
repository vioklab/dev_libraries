<?
class fakeclass {

   public $arrFields;

function parsearray(){

      $muyarray = $this->arrFields;

$outp = "function GetXmlHttpObject(handler)
{
 var objXmlHttp=null
     if (navigator.userAgent.indexOf(\"Opera\")>=0)
		{
		alert(\"This example doesn't work in Opera\")
		return 
		}
		if (navigator.userAgent.indexOf(\"MSIE\")>=0)
		{ 
		var strName=\"Msxml2.XMLHTTP\"
		if (navigator.appVersion.indexOf(\"MSIE 5.5\")>=0)
		{
		strName=\"Microsoft.XMLHTTP\"
		} 
		try
		{ 
		objXmlHttp=new ActiveXObject(strName)
		objXmlHttp.onreadystatechange=handler 
		return objXmlHttp
		} 	
		catch(e)
		{ 
		alert(\"Error. Scripting for ActiveX might be disabled\")
		return 
		} 
		} 
		if (navigator.userAgent.indexOf(\"Mozilla\")>=0)
		{
		objXmlHttp=new XMLHttpRequest()
		objXmlHttp.onload=handler
		objXmlHttp.onerror=handler 
		return objXmlHttp
		}
		}";
	
		
$outp .= "function getagents(column,direc,end) {		
                   if(!end){
                   end = 0;
                   }
          var myRandom=parseInt(Math.random()*99999999);  // cache buster
          xmlHttp=GetXmlHttpObject(handleHttpResponse);
          xmlHttp.open(\"GET\",url + \"param=\" + escape(column) + \"&end=\"+ end+ \"&mode=list&dir=\" + direc + \"&rand=\" + myRandom, true);
          xmlHttp.send(null);
}";
$outp .= "function spassera(column,direc,end){
		var myRandom=parseInt(Math.random()*99999999);  // cache buster
		xmlHttp=GetXmlHttpObject(handleHttpResponse);
		xmlHttp.open(\"GET\",url + \"param=\" + escape(column) + \"&end=\"+ end + \"&mode=list&dir=\" + direc + \"&rand=\" + myRandom, true);
		xmlHttp.send(null);
}";
		
$outp .= "function saveRecord(mode,".$muyarray[0][0].",param,dir,end)
		{ ";
          for($i=1; $i<count($muyarray); $i++){
              $outp .= $muyarray[$i][0]." = document.getElementById(\"txt".$muyarray[$i][0]."\").value;\n";
          }

          $outp .= "var myRandom=parseInt(Math.random()*99999999);  // cache buster
		xmlHttp=GetXmlHttpObject(handleHttpResponse);";
		$outp .= "xmlHttp.open(\"GET\",url + \"".$muyarray[0][0]."=\"+".$muyarray[0][0]."+";

          for($i=1; $i<count($muyarray); $i++){
              $outp .= "\"&".$muyarray[$i][0]."=\"+".$muyarray[$i][0]."+";
          }
 
          $outp .= "\"&end=\"+end+\"&mode=\"+mode+\"&param=\"+escape(param)+\"&dir=\"+dir+\"&rand=\"+myRandom, true);";
		$outp .= "xmlHttp.send(null);
		}";
     	$outp .= "function saveNewRecord(mode,param,dir,end)
		{";

          for($i=1; $i<count($muyarray); $i++){
              $outp .= $muyarray[$i][0]." = document.getElementById(\"txt".$muyarray[$i][0]."\").value;\n";
          }
          $outp .=  "if ( ";
          for($i=1; $i<count($muyarray)-1; $i++){
              $outp .=  $muyarray[$i][0].".length == 0 || ";
          }
          $outp .=  $muyarray[$i][0].".length == 0 )";
		$outp .= "{ alert(\"Please enter value for all the fields\"); 	}
		else	
		{
		 if(!end){
               end = 0;
		}	
          var myRandom=parseInt(Math.random()*99999999);  // cache buster
		xmlHttp=GetXmlHttpObject(handleHttpResponse); ";
          $outp .= "xmlHttp.open(\"GET\",url + \"".$muyarray[1][0]."=\"+".$muyarray[1][0]."+";
          for($i=2; $i<count($muyarray); $i++){
          $outp .= "\"&".$muyarray[$i][0]."=\"+".$muyarray[$i][0]."+";
          }
          $outp .= "\"&end=\"+end+\"&mode=\"+mode+\"&param=\"+escape(param)+\"&dir=\"+dir+\"&rand=\"+myRandom, true);";
          $outp .= "xmlHttp.send(null);			
		}
		}";
		
$outp .= "function newRecord(mode,param,dir,end)
		{
		var myRandom=parseInt(Math.random()*99999999);  // cache buster
		xmlHttp=GetXmlHttpObject(handleHttpResponse);
		xmlHttp.open(\"GET\",url+\"mode=\"+mode+ \"&end=\"+ end +\"&param=\" + escape(param) + \"&dir=\" + dir + \"&rand=\" + myRandom, true);
		xmlHttp.send(null);
		} ";
		
$outp .= "function manipulateRecord(mode,id,param,dir,end)
		{
             if(mode=='delete'){
     	        if ( confirm(\"Are you sure you want to DELETE record ?\") != 1 )
		        {
			       return false;	
		        }
          }	
          var myRandom=parseInt(Math.random()*99999999);  // cache buster
		xmlHttp=GetXmlHttpObject(handleHttpResponse);
		xmlHttp.open(\"GET\",url+\"".$muyarray[0][0]."=\"+id+ \"&end=\"+ end+\"&mode=\"+mode+\"&param=\" + escape(param) + \"&dir=\" + dir + \"&rand=\" + myRandom, true);
		xmlHttp.send(null);
		}";	
		
		
$outp .= "function handleHttpResponse() {
          if (xmlHttp.readyState == 4) {
          document.getElementById(\"hiddenDIV\").style.visibility=\"visible\"; 		
          document.getElementById(\"hiddenDIV\").innerHTML='';
          document.getElementById(\"hiddenDIV\").innerHTML=xmlHttp.responseText;
	     }
		}";
		
		
return $outp;

}
}


include("confarray.php");      // field to edit wiew insert


$ajx = new fakeclass();        // start class
$ajx->arrFields = $muyarray;   // send array configuration
echo $ajx->parsearray();       // generate ajax javascript

		
?>		
		
