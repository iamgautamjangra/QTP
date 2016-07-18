'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_UserActivity_for_LoginFailureAttempts
' Description					:	Validate User Action in the Audit Log page for login failure attempt
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_LoginFailureAttempts", "AAA_AUL_TC_009"
 

strUsernamevalid=testcasedata.getValue("strUsernamevalid")
strPasswordvalid=testcasedata.getvalue("strPasswordvalid")
strInvalidUsername=testcasedata.getValue("strInvalidUsername")
strInvalidPassword=testcasedata.getvalue("strInvalidPassword")

ivm.page(Common_page).webLink("LogOut").press

wait wait10

ivm.page(Login_page).webEdit("Username").setValue strInvalidUsername
ivm.page(Login_page).webEdit("Password").setValue strInvalidPassword
ivm.page(Login_page).webLink("LogIn").press
wait wait10
ivm.page(Login_page).webElement("ErrorMessage").assertExist "True"
ivm.page(Login_page).webElement("ErrorMessage").assertStatus "Visible"

ivm.page(Login_page).webEdit("Username").setValue strUsernamevalid
ivm.page(Login_page).webEdit("Password").setValue strPasswordvalid
ivm.page(Login_page).webLink("LogIn").press
wait wait10
ivm.page(Common_page).webLink("Administration").press
ivm.page(Common_page).webLink("AuditLog").press
wait wait10
ivm.page(AuditLog_page).webElement("AuditLog").assertExist "True"
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"

REM ivm.page(AuditLog_page).webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_LoginFailureAttempts", "AAA_AUL_TC_009"
