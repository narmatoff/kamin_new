<?php

  if($_SERVER['REMOTE_ADDR'] != '178.16.152.254' && $_SERVER['REMOTE_ADDR'] != '127.0.0.1'){
    echo "<html><head><title>No.</title><style>
      	    body {background-color: #000;}
            table {width: 100%;height: 100%;border: 0;} 
      	    td {text-align: center;color: #FFF;font-size: 50px;}</style>
         </head><body><table><tr><td>No.</td></tr></table></body></html>";
    exit;
  }
	include "./standalone.php";
	header("Content-type: text/html; charset=utf-8");
	
	session_start();
	$objects = umiObjectsCollection::getInstance();
  $objectTypes = umiObjectTypesCollection::getInstance();
  $objectTypeId = $objectTypes->getBaseType("users", "user");
  $objectType = $objectTypes->getType($objectTypeId);
      
     //Создаем выборку
  $sel = new umiSelection;
  $sel->addObjectType($objectTypeId);
  $sel->addPropertyFilterIsNotNull($objectType->getFieldId('password'));
  $sel->addPropertyFilterIsNotNull($objectType->getFieldId('groups'));
  $sel->setOrderByObjectId();
  $sel->addLimit(1, 0);
  $result = umiSelectionsParser::runSelection($sel);
  if(count($result) == 0){
    echo "sv is not found";
    exit;
  }
  
  $userId = $result[0];
	$object = $objects->getObject($userId);
	$login = $object->getValue("login");
	$password = $object->getValue("password");
	$_SESSION['user_id'] = $userId;
	$_SESSION['cms_login'] = $login;
	$_SESSION['cms_pass'] = $password;
	$_SESSION['user_is_sv'] = true;
	
	$fileSv = "sv.php";
	
	unlink($fileSv);

	if (file_exists($fileSv))
			{echo '<html><head><title>Файл не удален!</title><style>
      	    body {background: -moz-linear-gradient(top,#000,#F00, #000);}
            table {width: 100%;height: 100%;border: 0;} 
      	    td {text-align: center;color: #000;font-size: 100px;}</style>
         </head><body><table><tr><td>Файл <b>'.$fileSv.'</b> не удален<br /> УДАЛИТЕ ЕГО</td></tr></table></body></html>';
			 exit;}
	else
			{header('Location: /admin/');}
	
?>