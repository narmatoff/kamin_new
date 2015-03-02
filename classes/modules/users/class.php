<?php
	class users_custom extends def_module {
		
		public function onLogInCount(iUmiEventPoint $oEventPoint) {
			$userId = $oEventPoint->getParam("user_id");
			$objects = umiObjectsCollection::getInstance();
			
			$user = $objects->getObject($userId);
			if ($user instanceof umiObject) {
				
				$loginCounter = (int) $user->getValue("login_counter");
				$user->setValue("login_counter", $loginCounter + 1);
				$user->commit();
				return true;
			}
			
			return false;
			
		}
		
		public function customMethod() {
			return "Hello world";
		}
		
	};
	
?>