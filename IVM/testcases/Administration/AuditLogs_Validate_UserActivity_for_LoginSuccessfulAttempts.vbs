'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_UserActivity_for_LoginSuccessfulAttempts
' Description					:	Validate User Action in the Audit Log page for successful attempt
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_LoginSuccessfulAttempts", "AAA_AUL_TC_008"

'Login with the valid Username and Password and follow the navigation.

ivm.page(Common_page).webLink("LogOut").press
strUsername=testcasedata.getvalue("Username")
strPassword=testcasedata.getvalue("Password")
strUser=testcasedata.getvalue("User")
strUserAction=testcasedata.getvalue("UserAction")
strItemtype=testcasedata.getvalue("Itemtype")


ivm.page(Login_page).webEdit("Username").setValue strUsername
ivm.page(Login_page).webEdit("Password").setValue strPassword
ivm.page(Login_page).webLink("LogIn").press
ivm.page(Common_page).webLink("Administration").press
ivm.page(Common_page).webLink("AuditLog").press

wait wait10

ivm.page(AuditLog_page).webElement("AuditLog").assertExist "True"
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"

ivm.page(AuditLog_page).webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_LoginSuccessfulAttempts", "AAA_AUL_TC_008"






