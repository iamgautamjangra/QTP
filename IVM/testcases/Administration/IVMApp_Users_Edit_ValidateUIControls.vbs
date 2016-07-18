'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_Edit_ValidateUIControls
' Description					:	Validate the "Edit" functionality of User Page.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case 
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_Edit_ValidateUIControls", "AAA_UMG_TC_010"

ivm.NavigateToMenu MENU_USERS
wait Wait5

strUsername=testcasedata.getvalue("Username")
strFullName=testcasedata.getvalue("FullName")
strRole=testcasedata.getvalue("strRole")
strStatus=testcasedata.getvalue("strStatus")

ivm.page(User_page).webTable("Users").presstblLink strUsername,6

with ivm.page(User_page)
		.webEdit("UserName").assertValue strUsername
		.webEdit("FullName").assertValue strFullName
		.weblist("Roles").assertSelectedItem strRole
		.webRadioGroup("Status").assertSelectedItem "true"
end with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_Edit_ValidateUIControls", "AAA_UMG_TC_010"
