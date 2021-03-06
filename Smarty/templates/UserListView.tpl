{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
 ********************************************************************************/
-->*}

<script type="text/javascript" src="include/js/smoothscroll.js"></script>

<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
<tbody><tr>
        <td valign="top"><img src="{'showPanelTopLeft.gif'|@vtiger_imageurl:$THEME}"></td>
        <td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">
<form action="index.php" method="post" name="EditView" id="form" onsubmit="VtigerJS_DialogBox.block();">
<input type='hidden' name='module' value='Users'>
<input type='hidden' name='action' value='EditView'>
<input type='hidden' name='return_action' value='ListView'>
<input type='hidden' name='return_module' value='Users'>
<input type='hidden' name='parenttab' value='Settings'>

        <br>

	<div align=center>
			{include file='SetMenu.tpl'}
				<!-- DISPLAY -->
				<table border=0 cellspacing=0 cellpadding=5 width=100% class="settingsSelUITopLine">
				<tr>
					<td width=50 rowspan=2 valign=top><img src="{'ico-users.gif'|@vtiger_imageurl:$THEME}" alt="{$MOD.LBL_USERS}" width="48" height="48" border=0 title="{$MOD.LBL_USERS}"></td>
					<td class=heading2 valign=bottom><b><a href="index.php?module=Settings&action=index&parenttab=Settings">{'LBL_SETTINGS'|@getTranslatedString}</a> > {$MOD.LBL_USERS}</b></td>
				</tr>
				<tr>
					<td valign=top class="small">{$MOD.LBL_USER_DESCRIPTION}</td>
				</tr>
				</table>
				
				<br>
				<table border=0 cellspacing=0 cellpadding=10 width=100% >
				<tr>
				<td>
					<div id="ListViewContents">
						{include file="UserListViewContents.tpl"}
					</div>	
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
		
	</div>

</td>
        <td valign="top"><img src="{'showPanelTopRight.gif'|@vtiger_imageurl:$THEME}"></td>
   </tr>
</tbody>
</form>
</table>

<div id="tempdiv" style="display:block;position:absolute;left:350px;top:200px;"></div>
{literal}
<script>
function getListViewEntries_js(module,url)
{
		document.getElementById("status").style.display="inline";
		jQuery.ajax({
				method:"POST",
				url:'index.php?module=Users&action=UsersAjax&file=ListView&ajax=true&'+url
		}).done(function(response) {
				document.getElementById("status").style.display="none";
				document.getElementById("ListViewContents").innerHTML= response;
			}
		);
}

function deleteUser(obj,userid)
{
		document.getElementById("status").style.display="inline";
		jQuery.ajax({
				method:"POST",
				url:'index.php?action=UsersAjax&file=UserDeleteStep1&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record='+userid
		}).done(function(response) {
				document.getElementById("status").style.display="none";
				document.getElementById("tempdiv").innerHTML= response;
				fnvshobj(obj,"tempdiv");
			}
		);
}
function transferUser(del_userid)
{
		document.getElementById("status").style.display="inline";
		document.getElementById("DeleteLay").style.display="none";
		var trans_userid=document.getElementById('transfer_user_id').options[document.getElementById('transfer_user_id').options.selectedIndex].value;
		jQuery.ajax({
				method:"POST",
				url:'index.php?module=Users&action=UsersAjax&file=DeleteUser&ajax=true&delete_user_id='+del_userid+'&transfer_user_id='+trans_userid
		}).done(function(response) {
				document.getElementById("status").style.display="none";
				document.getElementById("ListViewContents").innerHTML= response;
			}
		);
}
</script>
{/literal}

