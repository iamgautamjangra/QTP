'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserLoggedIn_Validate_UsernameLink_WorkFlow_OnTopMenubar
' Description					:	Validate the User Name Link displayed on the top Menu bar
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "UserLoggedIn_Validate_UsernameLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_012"

	
'ivm.page(Common_page).webLink("LogOut").press
'wait 5
'-------->To check the username link on top menu bar

strUsername =testcasedata.getvalue("Username")
strPassword =testcasedata.getvalue("Password")

ivm.page(Login_page).webEdit("Username").setValue strUsername
ivm.page(Login_page).webEdit("Password").setValue strPassword
ivm.page(Login_page).webLink("LogIn").press
wait Wait5
ivm.page(Common_page).webLink("admin").assertStatus "Visible"
ivm.page(Common_page).webLink("admin").assertExist "True"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserLoggedIn_Validate_UsernameLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_012"
