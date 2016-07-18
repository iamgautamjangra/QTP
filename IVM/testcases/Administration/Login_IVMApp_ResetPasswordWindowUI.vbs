'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Test_Login_ivmApp_ResetPasswordWindowUI
' Description					:	Validate the UI of Reset password window for login page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Test_Login_ivmApp_ResetPasswordWindowUI", "AAA_AUT_TC_016"
ivm.page(Common_page).webLink("LogOut").press	

'Login_ivmApp_ResetPasswordWindow
ivm.page(Login_page).webLink("ForgotPassword").press
wait Wait5
ivm.page(Login_page).webElement("ResetPassword").assertStatus "Visible"
ivm.page(Login_page).webElement("ResetPassword").assertExist "True"

ivm.page(Login_page).webElement("EmailAddress").assertStatus "Visible"
ivm.page(Login_page).webElement("EmailAddress").assertExist "True"

ivm.page(Login_page).webEdit("Email").assertStatus "Visible"
ivm.page(Login_page).webEdit("Email").assertExist "True"

ivm.page(Login_page).webLink("Cancel").assertStatus "Visible"
ivm.page(Login_page).webLink("Cancel").assertExist "True"

ivm.page(Login_page).webLink("Submit").assertStatus "Visible"
ivm.page(Login_page).webLink("Submit").assertExist "True"
ivm.page(Login_page).webLink("Cancel").press

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Test_Login_ivmApp_ResetPasswordWindowUI", "AAA_AUT_TC_016"
