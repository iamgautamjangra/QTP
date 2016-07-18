'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_CreateNewRole_InvalidCredentials
' Description					:	Create new Role with invalid credentials.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_InvalidCredentials", "AAA_ATH_TC_008"


strNameInvalid=testcasedata.getvalue("NameInvalid")
strSelectVal=testcasedata.getvalue("PagePermission")
strErrName=testcasedata.getvalue("ErrName")
strErrPermission=testcasedata.getvalue("ErrPermission")
strErrInfo=testcasedata.getvalue("ErrInfo")
strSearchVal = testcasedata.getvalue("PermissionType")

ivm.NavigateToMenu MENU_ROLES

'Validate for balnk value
ivm.page(Roles_page).webLink("CreateNewRole").press
ivm.page(Roles_page).webEdit("RoleName").setValue strNameInvalid

ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strSearchVal,strSelectVal,2

ivm.page(Roles_page).webLink("CreateRole").press 

ivm.page(Roles_page).webElement("ErrName").assertExist "True"
ivm.page(Roles_page).webElement("ErrName").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrName").assertErrorText strErrName

ivm.page(Roles_page).webElement("ErrPermission").assertExist "True"
ivm.page(Roles_page).webElement("ErrPermission").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrPermission").assertErrorText strErrPermission

ivm.page(Roles_page).webElement("ErrInfo").assertExist "True"
ivm.page(Roles_page).webElement("ErrInfo").assertStatus "Visible"



'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_InvalidCredentials", "AAA_ATH_TC_008"
