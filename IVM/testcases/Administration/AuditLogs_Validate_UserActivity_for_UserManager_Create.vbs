'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_UserActivity_for_UserManager_Create
' Description					:	Validate User Action in the Audit Log page for new user create
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Create", "AAA_AUL_TC_010"
 
 
'AuditLogs_Validate_UserActivity_for_UserManager_Create
strEmailAddress=testcasedata.getvalue("strEmailAddress")
strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strRoles = testcasedata.getvalue("Roles")
strStatus = testcasedata.getvalue("Status")

strUser=testcasedata.getvalue("User")
strUserAction=testcasedata.getvalue("UserAction")
strItemtype=testcasedata.getvalue("Itemtype")

ivm.page(Common_page).webLink("Administration").press
wait wait10
ivm.page(User_page).webLink("UserManager").press
wait wait10
ivm.page(User_page).webLink("Users").press
wait wait10
ivm.page(User_page).webLink("CreateNewUser").press
wait wait20
ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).webEdit("FullName").setValue strFullname
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress
ivm.page(User_page).webList("Roles").selectItem strRoles
ivm.page(User_page).webRadioGroup("Status").SelectGroupItem strStatus
ivm.page(User_page).webLink("CreateUser").press
wait wait10
ivm.page(Common_page).webLink("Administration").press
wait wait10
ivm.page(Common_page).webLink("AuditLog").press
wait wait20
ivm.page(AuditLog_page).webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Create", "AAA_AUL_TC_010"








