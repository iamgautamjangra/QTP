'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_CreateNewRole_Cancel
' Description					:	Validate the Create New Role page should be closed once click on the "Cancel" Button.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_Cancel", "AAA_ATH_TC_010"
	

'Click on the "Administration" Link.
strNamevalid=testcasedata.getvalue("Namevalid")
strDescription=testcasedata.getvalue("Description")

strPagePermissionType=testcasedata.getvalue("PagePermissionType")
strPagePermission=testcasedata.getvalue("PagePermission")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press

ivm.page(Roles_page).webLink("CreateNewRole").press

ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webEdit("RoleDescription").setValue strDescription  

ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2

ivm.page(Roles_page).webLink("Cancel").press  
ivm.page(Roles_page).webLink("CreateNewRole").assertStatus "Visible"

'End Test Case                             
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_Cancel", "AAA_ATH_TC_010"
