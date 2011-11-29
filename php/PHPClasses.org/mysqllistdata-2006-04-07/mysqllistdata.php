<?
//KONSTANTA

define ('HOST','localhost'); //YOUR HOST GOES HERE
define ('USER','root');//YOUR MYSQL USER GOES HERE
define ('PASSWORD',''); //YOUR DATABASE PASSWORD GOES HERE
define ('DATABASE','pustaka');//YOUR DATABASE NAME GOES HERE
//CLASS
class mySQLconn
	{
				private $host;
				private $user;
				private $pass;
				private	$conn;
				private $database;
				private $row;
				private	$res;
				function setConn($host_,$user_,$pass_,$database_)
						{
								$this->host 	= $host_;
								$this->user 	= $user_;
								$this->pass 	= $pass_;
								$this->database = $database_;
						}
				function connectMySql()
						{
							$this->conn		=	mysql_connect($this->host,$this->user,$this->pass,"","") 
							or die("<b>KONEKSI KE DATABASE TIDAK TERJALIN !!! Penyebab :".mysql_error()."</b>");
							mysql_select_db($this->database,$this->conn);
						}
				
				function runQry($sql)
						{
							$this->res	=	mysql_query($sql,$this->conn);	
							return $this->res;
						}	
						
				function closeConn()
						{
							mysql_close($this->conn);		
						}
				
				function fetch_row()
						{
							$this->row 	=  mysql_fetch_row($this->res);
							return $this->row;
						}
	};



class mySqlDataList 
			{			private		$nama;
						private		$column_name;
						private		$table_name;
						private		$column_header;
						private		$align;
						private		$line_num;
						private		$action;
						private		$width;
						private		$mode;
						private		$itr; 		
						private		$field;			
						private		$value;		
						private		$set_val; 		
						private		$where_val;		
						private		$column_no;
						private		$conn;
						
						public		$table_width;
						public		$itr_; 		
						public		$start;
						public		$condition;
						
						function __construct(	$name,
												$column_name,
												$table_name,
												$condition,
												$column_header,
												$align,
												$start,
												$line_num,
												$action, // action page
												$width,
												$mode)  // mode = 0 view,mode=1 edit,mode = 2 delete
								{
										$this->name				= 	$name;
										$this->column_name		=	$column_name;
										$this->table_name		=	$table_name;
										$this->condition		=	$condition;
										$this->column_header	=	$column_header;
										$this->align			=	$align;
										$this->start			=	$start;
										$this->line_num			=	$line_num;
										$this->action			=	$action;
										$this->width			=	$width;
										$this->mode				=	$mode;
										$this->line_num			=	$line_num;
										$this->conn				=	new mySQLconn();
										$this->conn->setConn(HOST,USER,PASSWORD,DATABASE);
										$this->conn->connectMysql();
										$this->table_width		=	100;
								}
						function __destruct()
								{
									$this->conn->closeConn();
								}
								
						function 	init()
								{
										$this->itr 				= 	1;
										$this->field			=	NULL;
										$this->value			=	NULL;
										$this->set_val 			=	NULL;
										$this->where_val		=	NULL;
										$this->column_no 		=	count($this->column_name);
										for ($this->itr=0; $this->itr < $this->column_no;$this->itr++)
											{
												
												$this->itr == $this->column_no-1? 
												$this->field = $this->field.$this->column_name[$this->itr]:
												$this->field = $this->field.$this->column_name[$this->itr].",";
											};
									
										
								}
						
						function	proceed()
								{
									if (isset($_POST['B3']))
											{
												if ($_POST['B3']=='Edit')
													{
														for ($this->itr=0;$this->itr<$this->column_no;$this->itr++)
															{
																$this->begining_value[$this->itr]=$_POST['f'.$this->itr];
									
																$this->updated_value[$this->itr]=$_POST['F'.$this->itr];
									
																$this->itr== $this->column_no-1?
																$this->set_val = $this->set_val.$this->column_name[$this->itr]."='".$this->updated_value[$this->itr]."' where "
																:$this->set_val = $this->set_val.$this->column_name[$this->itr]."='".$this->updated_value[$this->itr]."',";
							
																$this->itr== $this->column_no-1?
																$this->where_val = $this->where_val.$this->column_name[$this->itr]."='".$this->begining_value[$this->itr]."'"
																:$this->where_val = $this->where_val.$this->column_name[$this->itr]."='".$this->begining_value[$this->itr]."' and ";
															};
				
															$update_query	=	'update '.$this->table_name.' set '.$this->set_val.$this->where_val;
															$this->conn->runQry($update_query);
												}
												elseif ($_POST['B3']=='Delete')
													{
														//echo "DATA TELAH DIHAPUS";
														for ($this->itr=0;$this->itr<$this->column_no;$this->itr++)
															{	
																$this->begining_value[$this->itr]=$_POST['f'.$this->itr];
																$this->itr== $this->column_no-1?
																$this->value	= $this->value.$this->column_name[$this->itr]."='".$this->begining_value[$this->itr]."'":
																$this->value	= $this->value.$this->column_name[$this->itr]."='".$this->begining_value[$this->itr]."' and ";
							
															};	
						
															$delete_query = 'delete from '.$this->table_name.' where '.$this->value;
															$this->conn->runQry($delete_query);
													};
											};

								}
						

						function	drawList()
						
							{
							
									$sql	=	'select '.$this->field.' from '.$this->table_name." where ".$this->condition." limit ".$this->start.",".$this->line_num;
									//assigning queries
									$this->mode!=0?$span =$this->column_no + 1:$span=$this->column_no;
	
									$this->conn->runQry($sql);

									//building tabel header
									echo '<div align="center">';
									echo '<center>';
									echo '<table border="1" cellspacing="0" id="AutoNumber1" cellpadding="0" width="'.$this->table_width.'" height="91">';
									echo '<form id ="a" name="a" action ="'.$this->action.'"  method="post" target="_self" >'; 
									echo '<tr><td  bgcolor="#C0C0C0" align="center" height="21" colspan="'.$span.'"><font face="Arial">'.$this->name.'</font></td></tr>';
									echo '</form>';
									echo '<form id ="xxx" name="xxx" action ="'.$this->action.'"  method="post" target="_self" >'; 
									echo '<tr>';
									for ($this->itr = 0 ; $this->itr< $this->column_no;$this->itr++)
										{
   											echo'<td bgcolor="#C0C0C0" align="center" height="26"><p align="center"><font face="Arial">'.$this->column_header[$this->itr].'</font></td>';
										};			
									if ($this->mode != 0)
										{
											echo'<td bgcolor="#C0C0C0"  align="center" valign = "middle" height="26"><p align="center"><font face="Arial">'."Action".'</font></td>';
										};
	
									echo'</tr>';
									echo '</form>';
	
									//building data
    								$this->itr=1;
	   								while($row 	= 	$this->conn->fetch_row())
										{
											echo '<form id ="'.$this->itr.'" name="'.$this->itr.'" action ="'.$this->action.'"  method="post" target="_self" >'; 
			 								echo '<tr>';
											for ($this->itr_ = 0; $this->itr_<$this->column_no;$this->itr_++)
												{	
	   												switch ($this->mode)
													{
														case 0:
															echo '<td align="'.$this->align[$this->itr_].'" height="19"><font face="Arial">'.$row[$this->itr_].'</font></td>';
														break;
														case 1:
														//nanti di buat ada yang bertipe dropdown list (buat entri/edit)
															echo'<td bgcolor="#FFFFFF"><div align="'.$this->align[$this->itr_].'" class="style18">'.
															'<input name="F'.$this->itr_.'" type="text" id="'.$this->itr.'row2'.'" size="'.$this->width[$this->itr_].'" maxlength="'
															.$this->width[$this->itr_].'" value="'.$row[$this->itr_].'">'.
															'</div></td>';
															
															echo '<input name = "f'.$this->itr_.'" type = "hidden" value ="'.$row[$this->itr_].'">';
														break;
														case 2:
														case 3:
							
															echo'<td bgcolor="#FFFFFF"><div align="'.$this->align[$this->itr_].'" class="style18">'.
															'<input name="F'.$this->itr_.'" type="text" id="'.$this->itr.'row2'.'" size="'.$this->width[$this->itr_].'" maxlength="'
															.$this->width[$this->itr_].'" value="'.$row[$this->itr_].'" readonly=" ">'.
															'</div></td>';
															echo '<input name = "f'.$this->itr_.'" type = "hidden" value ="'.$row[$this->itr_].'">';
														break;
														default:
														break;
													};
												};
					
										if ($this->mode != 0)
												{
													switch ($this->mode)
													{
														case 1:
														echo'<td  bgcolor="#FFFFFF" align="left" height="1"><p align="center"><input type="submit" value="Edit" name="B3"></td>';
														break;
														case 2:
													echo'<td  bgcolor="#FFFFFF" align="left" height="1"><p align="center"><input type="submit" value="Delete" name="B3"></td>';
														break;
													};
						
												};
									echo '</tr>';
									echo '</form>';
	  								$this->itr++;
								};

								echo '<tr><td align="left" height="24" colspan="'.$span.'" bgcolor="#C0C0C0"><p align="right"><font face="Arial">Generated by mysqllistdata (open source) 2006 </font></td></tr>';
								echo '</table></center></div>';

						}

						function	show()
								{
										$this->init();
										$this->proceed();
										$this->drawList();
								}
								
						function	set_mode($mode)
								{
										$this->mode = $mode;
								}
						function  setdatanum($linenum)
								{
									$this->line_num=$linenum;
								}

				};


?>
