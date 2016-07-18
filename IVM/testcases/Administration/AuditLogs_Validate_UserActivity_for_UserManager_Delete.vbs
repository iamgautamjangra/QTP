'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_UserActivity_for_UserManager_Delete
' Description					:	Validate User Action in the Audit Log page for delete the existing user
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Delete", "AAA_AUL_TC_012"
 	

strRoleName=testcasedata.getvalue("RoleName")
strUser=testcasedata.getvalue("User")
strUserAction=testcasedata.getvalue("UserAction")
strItemtype=testcasedata.getvalue("Itemtype")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
ivm.page(Roles_page).webLink("CreateNewRole").press
wait wait5
ivm.page(Roles_page).webEdit("RoleName").setValue strRoleName
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem "Data Analytics","Read Only",2
ivm.page(Roles_page).webLink("CreateRole").press  
wait wait5

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press

ivm.page(Roles_page).webTable("Roles").pressLink strRoleName,"Delete",5
ivm.page(Roles_page).webLink("DeleteConfirm").assertExist "True"
ivm.page(Roles_page).webLink("DeleteConfirm").assertStatus "Visible"
ivm.page(Roles_page).webLink("DeleteConfirm").press

ivm.page(Common_page).webLink("AuditLog").press
ivm.page(AuditLog_page).webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_UserActivity_for_UserManager_Delete", "AAA_AUL_TC_012"
