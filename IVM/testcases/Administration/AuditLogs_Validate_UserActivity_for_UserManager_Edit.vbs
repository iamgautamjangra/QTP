'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_UserActivity_for_UserManager_Edit
' Description					:	Validate User Action in the Audit Log page for update the existing user
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Edit", "AAA_AUL_TC_011"

ivm.page(Common_page).webLink("Administration").press
wait wait10
ivm.page(User_page).webLink("UserManager").press
wait wait10
ivm.page(User_page).webLink("Users").press
wait wait10
strUsername=testcasedata.getvalue("Username")
strEditFullName=testcasedata.getvalue("EditFullName")
strUser=testcasedata.getvalue("User")
strUserAction=testcasedata.getvalue("UserAction")
strItemtype=testcasedata.getvalue("Itemtype")

ivm.page(User_page).webTable("Users").presstblLink strUsername,6 
ivm.page(User_page).webEdit("FullName").setValue strEditFullName
ivm.page(User_page).webLink("SaveChanges").press
wait wait20

'Validate from Audit LOg Table
ivm.page(Common_page).webLink("AuditLog").press
wait wait20
ivm.page(AuditLog_page).webTable("AuditLog").assertExist "True"

'ivm.page(AuditLog_page).webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Edit", "AAA_AUL_TC_011"
