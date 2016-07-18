'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_CreateNewRole_Validcredentials
' Description					:	Validate the UI Controls of create new Role page and also validate the Functionaity  of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case 
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_Validcredentials", "AAA_ATH_TC_009"

ivm.NavigateToMenu MENU_ROLES

strNamevalid=testcasedata.getvalue("Namevalid")
strPagePermissionType=testcasedata.getvalue("PagePermissionType")
strPagePermission=testcasedata.getvalue("PagePermission")

ivm.page(Roles_page).webLink("CreateNewRole").press
ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2
ivm.page(Roles_page).webLink("CreateRole").press  

ivm.page(Roles_page).webTable("Roles").assertValue strNamevalid,1
ivm.page(Roles_page).assertformRecord frmCreateNewRole, "True",strNamevalid,strNamevalid

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_Validcredentials", "AAA_ATH_TC_009"