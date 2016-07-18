'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserLoggedIn_Validate_HelpLink_WorkFlow_OnTopMenubar
' Description					:	Validate the Help Link displayed on the top Menu bar
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "UserLoggedIn_Validate_HelpLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_014"
	

'-------->To check the Help link on top menu bar
strUsername =testcasedata.getvalue("Username")
strPassword =testcasedata.getvalue("Password")

ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
 ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
 ivm.page(Login_page).webLink("LogIn").press
 wait Wait5
ivm.page(Common_page).webLink("Help").assertStatus "Visible"
ivm.page(Common_page).webLink("Help").assertExist "True"
'ivm.page(Common_page).webLink("LogOut").press
wait Wait5

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserLoggedIn_Validate_HelpLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_014"
