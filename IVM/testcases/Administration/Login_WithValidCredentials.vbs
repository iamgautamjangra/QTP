'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Login_WithValidCredentials
' Description					:	Validate login for User with valid User Name and valid password
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "Login_WithValidCredentials", "AAA_AUT_TC_002"
 
 	

strUsername=testcasedata.getvalue("Username")
strPassword=testcasedata.getvalue("Password")


ivm.page(Login_page).webEdit("Username").setValue strUsername
ivm.page(Login_page).webEdit("Password").setValue strPassword
ivm.page(Login_page).webLink("LogIn").press
ivm.page(Common_page).webLink("Administration").assertStatus "Visible"
ivm.page(Common_page).webLink("Administration").assertExist "True"


'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Login_WithValidCredentials", "AAA_AUT_TC_002"
