'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Login_ISMApp_ResetPasswordWindow_Validdata
' Description					:	Validate forgot password for login page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Cases

executionController.startTestCase_w_TestCaseNumber "Login_ISMApp_ResetPasswordWindow_Validdata", "AAA_AUT_TC_017"


'Validate steps for forgot password for login page
strEmail = testcasedata.getvalue("Email")
strEmailSent=testcasedata.getvalue("EmailSent")
strUsername=testcasedata.getvalue("strUsername")

'ivm.page(Login_page).webEdit("Username").setValue strUsername

ivm.page(Login_page).webLink("ForgotPassword").press
wait Wait5
ivm.page(Login_page).webElement("EmailAddress").assertStatus "Visible"
ivm.page(Login_page).webElement("EmailAddress").assertExist "True"
ivm.page(Login_page).webEdit("Email").setValue strEmail
ivm.page(Login_page).webLink("Submit").press
wait 8

ivm.page(Login_page).webElement("SuccessMessage").assertExist "True"
ivm.page(Login_page).webElement("SuccessMessage").assertStatus "Visible"
ivm.page(Login_page).webLink("Cancel").press

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Login_ISMApp_ResetPasswordWindow_Validdata", "AAA_AUT_TC_017"


