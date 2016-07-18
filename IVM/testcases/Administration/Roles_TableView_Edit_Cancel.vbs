'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	_Roles_TableView_Edit_Cancel
' Description					:	Validate the Create New Role page should be closed once click on the "Cancel" Button.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Roles_TableView_Edit_Cancel", "AAA_ATH_TC_015"
 	

strRoleName=testcasedata.getvalue("RoleName")
strNamevalid=testcasedata.getvalue("Namevalid")
strDescription=testcasedata.getvalue("Description")
strPagePermissionType=testcasedata.getvalue("PagePermissionType")
strPagePermission=testcasedata.getvalue("PagePermission")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
wait 2
ivm.page(Roles_page).webTable("Roles").pressTblLink strRoleName,1
wait 2
ivm.page(Roles_page).webLink("EditDetails").press

ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webEdit("RoleDescription").setValue strDescription  
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2

ivm.page(Roles_page).webLink("Cancel").press  

ivm.page(Roles_page).webElement("GeneralRoleSettings").assertExist "True"
ivm.page(Roles_page).webElement("GeneralRoleSettings").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_TableView_Edit_Cancel", "AAA_ATH_TC_015"
