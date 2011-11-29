<?
//  
// +------------------------------------------------------------------------+
// | PHP version 5.0 					                               |
// +------------------------------------------------------------------------+
// | Description:												 |
// | class to manage data in grid using AJAX		  					 |	
// | 														 |	
// +------------------------------------------------------------------------+
// | Author				: Neeraj Thakur <neeraj_th@yahoo.com>    	 |
// | Created Date     	: 28-08-2006                  			 	 |
// | Last Modified    	: 28-08-2006                  				 |
// | Last Modified By 	: Neeraj Thakur                  				 |
// +------------------------------------------------------------------------+




class clsAJAX 
{
	public $dbhost;
	public $dbuname;
	public $dbpass;
	public $dbname;
	public $fiwhere = FALSE;
	public $hideid = TRUE;
	public $viewrec = 5;
	
	public $arrTable = "tblUsers";
	public $arrFields = array();
    /*  public $arrFields = array(array('UserId','Id tabella',0,'hidden'),
                                    array('Name','Nome Utente',30,'text'),
                                    array('Email','Email',50,'text'),
                                    array('DOB','DoBBBB',50,'select',array(0=>'va2',1=>'va55')));
	                     */
	public function __construct()
	{
		$dbhost = "localhost";
		$dbuname = "root";
		$dbpass = "root";
		$dbname = "guru";

		$db = mysql_connect($dbhost, $dbuname, $dbpass);
		if (!$db) {  die('There was a problem with the database, please try back later db.php'); }
		mysql_select_db($dbname, $db);
	}
	
	public function showList($id=''){
		
	
	if($this->hideid==TRUE){
	 $hide = 1;
	}else{
	 $hide = 0;
	}
	//$rec=$this->viewrec;
	
	
	
     if (empty($_REQUEST['end'])){
               $end = 0;
         }else{
               $end=$_REQUEST['end'];
         }
     $limit = $this->viewrec;
     $textout = "";
	$param = $_GET['param'];
	$dir = $_GET['dir'];
			
     if(strlen($param)>0){				
				
		//	$sortupimg = '^';
		//	$sortdownimg = 'v';
			
	$param = $_REQUEST['param'];
	$dir = $_REQUEST['dir'];
			
//start fields generation
			if ( $_GET['dir'] == 'desc' )
			{
				$textout .= '<tr class="txtheading">';
                    for ($i = $hide ; $i < count($this->arrFields) ; $i ++ )
				{
					$textout .= ($_GET['param'] == $this->arrFields[$i]) ? "<td>
                         <a href=\"javascript:getagents('".$this->arrFields[$i][0]."','')\">".$this->arrFields[$i][1]."</a></td>":"
                     <td><a href=\"javascript:getagents('".$this->arrFields[$i][0]."','')\">".$this->arrFields[$i][1]."</a></td>";					
				
                     $ucc[] = $this->arrFields[$i][2];
                    }
                    $summe = array_sum($ucc)*15;
               }
			else
			{
			
				$textout .= '<tr class="txtheading">';
				for ( $i = $hide ; $i < count($this->arrFields) ; $i ++ )
				{
					$textout .= ($_GET['param'] == $this->arrFields[$i]) ? "<td>
                         <a href=\"javascript:getagents('".$this->arrFields[$i][0]."','desc')\">".$this->arrFields[$i][1]."</a></td>":"
                     <td><a href=\"javascript:getagents('".$this->arrFields[$i][0]."','desc')\">".$this->arrFields[$i][1]."</a></td>";					
				$ucc[] = $this->arrFields[$i][2];
                    }
                   $summe = array_sum($ucc)*15;
			}			

               	$textout .= "<td colspan=\"2\">&nbsp;</td>";
				$textout .= "</tr>";


//end fields generation

				$arrf='';
				for ($i=0 ; $i<count($this->arrFields[0]) ; $i ++ )
				{
					//echo $arrf .= ','.$this->arrFields[$i][0];
				}
                       if($this->fiwhere){
                          $wherec = "WHERE ".$this->fiwhere."='".$_REQUEST['whe']."'";
                         }else{
                          $wherec = "";
                        }

   $q = "SELECT * FROM ".$this->arrTable." ".$wherec." ORDER BY ".$param." ".$dir."  LIMIT ".$end.",".$limit.";";
                    //echo "<b>".$q."</b>";
		/* display query */
          		
                   $result = mysql_query($q);
				$b = 0;
                    while( $myrow = mysql_fetch_array($result) ){
				$b++;	


                         if ($id == $myrow[$this->arrFields[0][0]] )
					//if(0==0)
                         {
                         					
//edit as per fields controls
/* $textout .= '
<tr class="txtcontents">
<td><input type="text" size="15" class="textbox" name="txtId" id="txtId" readonly value="'.$myrow[$this->arrFields[0][0]].'"></td>';
    */
for($oi=$hide; $oi<count($this->arrFields); $oi++){

  switch($this->arrFields[$oi][3]){
               case "textarea":
                    $textout .= "<td><textarea class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\">".$myrow[$this->arrFields[$oi][0]]."</textarea></td>";
               break;
               case "text":
                    if(!$this->arrFields[$oi][2]){
                        $sz = "";
                    }else{
                        $sz = "size=\"".$this->arrFields[$oi][2]."\"";
                    
                    }
                    $textout .= "<td><input type=\"text\" ".$sz." class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" value=\"".$myrow[$this->arrFields[$oi][0]]."\"></td>";
               break;
               case "hidden":
                    if(!$this->arrFields[$oi][2]){
                        $sz = "";
                    }else{
                        $sz = "size=\"".$this->arrFields[$oi][2]."\"";

                    }
                    $textout .= "<td><input type=\"hidden\" ".$sz." class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" value=\"".$myrow[$this->arrFields[$oi][0]]."\"></td>";
               break;
               case "select":

                    //var_dump($this->arrFields[$oi][4]);

                    $textout .= "<td><select class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" >";
                           foreach($this->arrFields[$oi][4] as $k=>$v){

                                  $textout .= "<option value=\"".$k."\" ";
                                  if($myrow[$this->arrFields[$oi][0]]==$k){
                                     $textout .= "selected=\"selected\"";
                                   }
                          $textout .= ">".$v."</option>";
                          }

                          $textout .="</select></td>";
               break;


  }

}

$textout .= "<td><a href=\"javascript:saveRecord('save','".$myrow[$this->arrFields[0][0]]."','".$param."','".$dir."','".$end."')\">Save</a></td>";
$textout .= "<td><a href=\"javascript:getagents('".$param."','".$dir."','".$end."')\">Cancel</a></td>";
$textout .= "</tr>";
							
					}
					else
					{
					   $textout .= '<tr class="txtcontents">';
						


                              for ( $i = $hide ; $i < count($this->arrFields) ; $i ++ )
						{
					  switch($this->arrFields[$i][3]){	
						    case "select":
                                        if(array_key_exists($myrow[$this->arrFields[$i][0]],$this->arrFields[$i][4])){
                                            $textout .= '<td width="18%">'.$this->arrFields[$i][4][$myrow[$this->arrFields[$i][0]]].'</td>';
                                     }else{
                                            $textout .= '<td width="18%">??</td>';
                                     }

                                  break;
                                  default:
                                  $textout .= '<td width="18%">'.$myrow[$this->arrFields[$i][0]].'</td>';
                                              break;
                                   }
                              	
                              }
						$textout .= "<td><a href=\"javascript:manipulateRecord('update',".$myrow[$this->arrFields[0][0]].",'".$param."','".$dir."','".$end."')\">Update</a></td>
						             <td><a href=\"javascript:manipulateRecord('delete',".$myrow[$this->arrFields[0][0]].",'".$param."','".$dir."','".$end."')\">Delete</a></td>
								</tr>";
								
			}
				}

			} else {
				$textout='<tr><td colspan="6">No record available..</td></tr>';
			}
		if ( $_REQUEST['mode'] != "new" )
		{
			$textout .= "<tr><td height=\"20\" valign=\"bottom\" class=\"txtcontents\" colspan=\"".(2+count($this->arrFields))."\">
			<a href=\"javascript:newRecord('new','".$param."','".$dir."','".$end."')\">New</a>";
			
       if ($end>1){
              $textout .= "<a href=\"javascript:spassera('".$param."','".$dir."','".intval($end-$this->viewrec)."')\">&lt;&lt;&lt;&lt;</a>&nbsp;&nbsp;";
          }
          $textout .= "&nbsp;";
          if ($b >=$this->viewrec){
         $textout .= "<a href=\"javascript:spassera('".$param."','".$dir."','".intval($end+$this->viewrec)."')\">&gt;&gt;&gt;&gt;</a>";
          }

               $textout .= '</td></tr>';
          }
		else if ( $_REQUEST['mode'] == "new" )
		{
					   $textout .= "
					   			<tr class=\"txtcontents\">
									<td></td>";
                   for($oi=1; $oi<count($this->arrFields); $oi++){
                       // $textout .= '<td><input type="text" size="15" class="textbox" name="txt'.$this->arrFields[$oi][0].'" id="txt'.$this->arrFields[$oi][0].'" value="'.$myrow[$this->arrFields[$oi][0]].'"></td>';
                      // }

                   //echo $oi;
  switch($this->arrFields[$oi][3]){
               case "textarea":
                    $textout .= "<td><textarea class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\">".$myrow[$this->arrFields[$oi][0]]."</textarea></td>";
               break;
               case "text":
                    if(!$this->arrFields[$oi][2]){
                        $sz = "";
                    }else{
                        $sz = "size=\"".$this->arrFields[$oi][2]."\"";

                    }
                    $textout .= "<td><input type=\"text\" ".$sz." class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" value=\"".$myrow[$this->arrFields[$oi][0]]."\"></td>";
               break;
               case "hidden":
                    if(!$this->arrFields[$oi][2]){
                        $sz = "";
                    }else{
                        $sz = "size=\"".$this->arrFields[$oi][2]."\"";

                    }
                    $textout .= "<td><input type=\"hidden\" ".$sz." class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" value=\"".$myrow[$this->arrFields[$oi][0]]."\"></td>";
               break;
               case "select":

                    //var_dump($this->arrFields[$oi][4]);

                    $textout .= "<td><select class=\"textbox\" name=\"txt".$this->arrFields[$oi][0]."\" id=\"txt".$this->arrFields[$oi][0]."\" >";
                           foreach($this->arrFields[$oi][4] as $k=>$v){

                                  $textout .= "<option value=\"".$k."\" ";
                                  if($myrow[$this->arrFields[$oi][0]]==$k){
                                     $textout .= "selected=\"selected\"";
                                   }
                          $textout .= ">".$v."</option>";
                          }

                          $textout .="</select></td>";
               break;
  }


  }
                         $textout .= "<td><a href=\"javascript:saveNewRecord('newsave','".$param."','".$dir."','".$end."')\">Save</a></td>
							   <td><a href=\"javascript:getagents('".$param."','".$dir."','".$end."')\">Cancel</a></td>
					             </tr>";
							
		}
		
          echo "<table cellspacing=\"0\" border=\"1\" cellpadding=\"2\" style=\"width:".$summe."px;\" align=\"center\">".$textout."</table>";

     }
	
	public function deleteRecord()
	{
		
          $q= "DELETE FROM ".$this->arrTable." WHERE ".$this->arrFields[0][0]." ='".$_REQUEST[$this->arrFields[0][0]]."';";

          $result = mysql_query($q);
	}	
	
	public function saveEditedRecord()
	{
		
           $q = "UPDATE ".$this->arrTable." SET ";

          for ($i=1 ; $i<count($this->arrFields)-1 ; $i ++ ){

             $q .= $this->arrFields[$i][0]."='".$_REQUEST[$this->arrFields[$i][0]]."',";

           }
           $q .= $this->arrFields[$i][0]."='".$_REQUEST[$this->arrFields[$i][0]]."'";


           $q.= " WHERE ".$this->arrFields[0][0]." ='".$_REQUEST[$this->arrFields[0][0]]."';";
		
           // echo $q;

           $result = mysql_query($q);
	}
	
	public function saveNewRecord()
	{
		

           $q = "INSERT INTO ".$this->arrTable." SET ";



           for ($i=1 ; $i<count($this->arrFields)-1 ; $i ++ ){

             $q .= $this->arrFields[$i][0]."='".$_REQUEST[$this->arrFields[$i][0]]."',";
           
           }
           if($this->fiwhere){
                $mas = ",".$this->fiwhere."='".$_REQUEST['whe']."'";
           }else{
                $mas = "";
           }
           $q .= $this->arrFields[$i][0]."='".$_REQUEST[$this->arrFields[$i][0]]."' ".$mas.";";

          //$q = "INSERT INTO ".$this->arrTable." SET= "(Name,Email,DOB) values("'.$_REQUEST['name'].'","'.'","'.$_REQUEST['dob'].'")';
		
          // echo $q;

          $result = mysql_query($q);
	}
}

//-------------------------end class----------------------


include("confarray.php");



$obj = new clsAJAX();
$obj->arrFields = $muyarray;


//$obj->fiwhere="ru_fp";
//$obj->arrTable = "tblUsers";
$obj->arrTable = "country";

switch($_REQUEST['mode']){
            case "delete":
                 $obj->deleteRecord();
                 $obj->showList();
            break;
            case "newsave":
                 $obj->saveNewRecord();
                 $obj->showList();
            break;
            case "new":
            case "list":
                 $obj->showList();
            break;
            case "save":
           	   $obj->saveEditedRecord();
                  $obj->showList();
            break;
            case  "update":
                  $obj->showList($_REQUEST[$muyarray[0][0]]);
            break;
}
?>
