<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class MailManager_Utils {
	static function safe_html_string($string) {
		global $root_directory;
		include_once ('include/htmlpurifier/library/HTMLPurifier.auto.php');
		$config = HTMLPurifier_Config::createDefault();
		$config->set('Core.Encoding', 'UTF8');
		$config->set('Cache.SerializerPath', "$root_directory/test/vtlib");
		$htmlpurifier_instance = new HTMLPurifier($config);
		$htmlSafe = $htmlpurifier_instance->purify($string);
		return $htmlSafe;
	}

	static function allowedFileExtension($filename) {
		global $upload_badext;
		$parts = explode('.', $filename);
		if (count($parts) > 1) {
			$extension = $parts[count($parts)-1];
			return (in_array(strtolower($extension), $upload_badext) === false);
		}
		return false;
	}

	static function emitJSON($object) {
		echo json_encode($object);
	}
}

?>