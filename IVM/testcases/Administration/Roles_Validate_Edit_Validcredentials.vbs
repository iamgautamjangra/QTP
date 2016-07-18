'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Edit_Validcredentials
' Description					:	Validate the UI Controls of create new Role page and also validate the Functionaity  of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Edit_Validcredentials", "AAA_ATH_TC_014"
 	
strRoleName=testcasedata.getvalue("RoleName")
strNamevalid=testcasedata.getvalue("Namevalid")
strRoleDescription=testcasedata.getvalue("RoleDescription")
strPagePermissionType=testcasedata.getvalue("PagePermissionType")
strPagePermission=testcasedata.getvalue("PagePermission")

'Roles_Validate_CreateNewRole_Validcredentials

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
ivm.page(Roles_page).webTable("Roles").pressLink strRoleName,"Edit",5

ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webEdit("RoleDescription").setValue strRoleDescription
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2

ivm.page(Roles_page).webLink("SaveChanges").press  
'ivm.page(Roles_page).webLink("CreateNewRole").assertStatus "Visible"

'Validate in table
ivm.page(Roles_page).webTable("Roles").assertValue strNamevalid,1

ivm.page(Roles_page).assertformRecord frmEditRole, "True",strNamevalid & ";" & strRoleDescription  ,strNamevalid

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Edit_Validcredentials", "AAA_ATH_TC_014"
