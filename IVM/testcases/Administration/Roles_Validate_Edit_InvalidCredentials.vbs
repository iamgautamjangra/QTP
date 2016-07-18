'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Edit_InvalidCredentials
' Description					:	Validate Roles updated successfully.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Edit_InvalidCredentials", "AAA_ATH_TC_013"

strRoleName=testcasedata.getvalue("RoleName")
strNameInvalid=testcasedata.getvalue("NameInvalid")
strSelectVal=testcasedata.getvalue("PagePermission")
strSearchVal = testcasedata.getvalue("PermissionType")
strErrPermission=testcasedata.getvalue("ErrPermission")
strErrName=testcasedata.getvalue("ErrName")
strErrInfo=testcasedata.getvalue("ErrInfo")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
ivm.page(Roles_page).webTable("Roles").pressLink strRoleName,"Edit",5

ivm.page(Roles_page).webEdit("RoleName").setValue strNameInvalid
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strSearchVal,strSelectVal,2
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem "System Setup",strSelectVal,2
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem "Administration",strSelectVal,2
ivm.page(Roles_page).webLink("SaveChanges").press 

ivm.page(Roles_page).webElement("ErrName").assertExist "True"
ivm.page(Roles_page).webElement("ErrName").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrName").assertErrorText strErrName

ivm.page(Roles_page).webElement("ErrPermission").assertExist "True"
ivm.page(Roles_page).webElement("ErrPermission").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrPermission").assertErrorText strErrPermission

ivm.page(Roles_page).webElement("ErrInfo").assertExist "True"
ivm.page(Roles_page).webElement("ErrInfo").assertStatus "Visible"
ivm.page(Roles_page).webElement("ErrInfo").assertErrorInfoText strErrInfo
ivm.page(Roles_page).webElement("ErrInfo").assertErrorInfoText strErrName
ivm.page(Roles_page).webElement("ErrInfo").assertErrorInfoText strErrPermission

ivm.page(Roles_page).webLink("Cancel").press 

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Edit_InvalidCredentials", "AAA_ATH_TC_013"
