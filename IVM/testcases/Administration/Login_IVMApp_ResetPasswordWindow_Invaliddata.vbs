'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Login_IVMApp_ResetPasswordWindow_Invaliddata
' Description					:	Validate Reset Password window for login page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Login_IVMApp_ResetPasswordWindow_Invaliddata", "AAA_AUT_TC_018"



'--------------------Login_ivmApp_ResetPasswordWindow_Invalid-------------------------------------------------
'Validate Reset Password window for login page
strInvalidEmail=testcasedata.getvalue("InvalidEmail")
strErrorMessage=testcasedata.getvalue("ErrorMessage")

'Blank Email address 
'Invalid Email
ivm.page(Login_page).webLink("ForgotPassword").press
wait 4
ivm.page(Login_page).webEdit("Email").setValue strInvalidEmail
ivm.page(Login_page).webLink("Submit").press
wait Wait5

ivm.page(Login_page).webElement("ErrorMessage").assertErrorText strErrorMessage
ivm.page(Login_page).webElement("ErrorMessage").assertExist "True"
ivm.page(Login_page).webElement("ErrorMessage").assertStatus "Visible"
wait 2
'Validate Cancel Button
ivm.page(Login_page).webLink("Cancel").press
wait 2
 
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Login_IVMApp_ResetPasswordWindow_Invaliddata", "AAA_AUT_TC_018"
