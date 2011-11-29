<?

$muyarray = array(array('UserId','Id tabella',0,'hidden'),
/* Db field name-----------^           ^      ^     ^
label field in table-------------------|      |     |
size 0 to unset lenght------------------------|     |
type of field text, hidden, textarea----------------|   */

                                    array('Name','Nome Utente',30,'text'),
                                    array('Email','Email',50,'text'),

array('DOB','DoBBBB',50,'select',array(0=>'va2',1=>'va55')));
/* selse require ARRAY-----^           ^              ^
array key db realtion------------------|              |
display this data in select ---------------------------   **/


/* $muyarray = array(array('UserId','Id tabella',0,'hidden'),
                                    array('Name','Nome Utente',30,'text'),
                                    array('Email','Email',50,'text'),
                                    array('DOB','DoBBBB',50,'select',array(0=>'va2',1=>'va55')));
                                    */

/* $muyarray = array(array('id','Id tabella',0,'hidden'),
                                    array('lastname','Nome Utente',30,'text'),
                                    array('email','Email',50,'text'),
                                    array('origin','DoBBBB',50,'select',array(0=>'va2',1=>'va55')));

                                      */
$muyarray = array(array('id','Id tabella',0,'hidden'),
                                    array('Code','Code',3,'text'),
                                    array('Name','Email',15,'text'),

                                    array('Continent','Continente',0,'select',array('Asia'=>'Asia', 'Europe'=>'Europe', 'North America'=>'North America', 'Africa'=>'Africa', 'Oceania'=>'Oceania', 'Antarctica'=>'Antarctica', 'South America'=>'South America')),

                                    array('SurfaceArea','Km^2',10,'text'),
                                    array('Population','Popolazione',10,'text'),
                                    array('LocalName','Local Name',10,'text')
                                    );

/*
search  display query  in getagents.php to wiew current query

file:
index.php
  var url = "getagents.php?whe=1&"; (url path, whe= where condition display record)

getagents.php
  generate table in ajax require confarray.php (this file)

ajax.php
  ajax javascript require confarray.php (this file)


css.css
  style
*/
?>
