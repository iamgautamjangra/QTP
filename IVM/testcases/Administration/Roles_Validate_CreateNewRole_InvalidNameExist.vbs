'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_CreateNewRole_InvalidNameExist
' Description					:	Validate the UI Controls of create new Role page and also validate the Functionaity  of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_InvalidNameExist", "AAA_ATH_TC_017"
	

'Roles_Validate_CreateNewRole_Validcredentials

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
ivm.page(Roles_page).webLink("CreateNewRole").press

strNamevalid=testcasedata.getvalue("Namevalid")
strNameInvalid=testcasedata.getvalue("NameInvalid")
strPagePermissionType=testcasedata.getvalue("PagePermissionType")
strPagePermission=testcasedata.getvalue("PagePermission")
strErrName=testcasedata.getvalue("ErrName")
strErrInfo=testcasedata.getvalue("ErrInfo")

ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2
ivm.page(Roles_page).webLink("CreateRole").press  

ivm.page(Roles_page).webLink("CreateNewRole").press
ivm.page(Roles_page).webEdit("RoleName").setValue strNameInvalid
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2
ivm.page(Roles_page).webLink("CreateRole").press  

ivm.page(Roles_page).webElement("ErrName").assertExist "True"
ivm.page(Roles_page).webElement("ErrName").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrName").assertErrorText strErrName

ivm.page(Roles_page).webElement("ErrInfo").assertExist "True"
ivm.page(Roles_page).webElement("ErrInfo").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrInfo").assertErrorInfoText strErrName
ivm.page(Roles_page).webElement("ErrInfo").assertErrorInfoText strErrInfo
ivm.page(Roles_page).webLink("Cancel").press  
 

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_Validcredentials", "AAA_ATH_TC_017"
