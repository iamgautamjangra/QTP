'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_TableView_Validate_ViewDetailsLinks
' Description					:	Validate the "View Details" link in "Actions" column in Audit Log table.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AuditLogs_TableView_Validate_ViewDetailsLinks", "AAA_AUL_TC_016"
 

ivm.page(Common_page).webLink("AuditLog").press
wait wait10
strUserName=testcasedata.getvalue("strUserName")

ivm.page(AuditLog_page).webTable("AuditLog").presstblLink strUserName,6
wait wait5

ivm.page(AuditLog_page).webElement("ViewAuditLogDetails").assertExist "True"
ivm.page(AuditLog_page).webElement("ViewAuditLogDetails").assertStatus "Visible"

ivm.page(AuditLog_page).webElement("Date").assertExist "True"
ivm.page(AuditLog_page).webElement("Date").assertStatus "Visible"

'***05/22/2012 03:18:45 PM *****
'************Date, User, Action, Item Type from DATABASE"
ivm.page(AuditLog_page).webElement("User").assertExist "True"
ivm.page(AuditLog_page).webElement("User").assertStatus "Visible"

ivm.page(AuditLog_page).webElement("Summary").assertExist "True"
ivm.page(AuditLog_page).webElement("Summary").assertStatus "Visible"

ivm.page(AuditLog_page).webElement("Action").assertExist "True"
ivm.page(AuditLog_page).webElement("Action").assertStatus "Visible"

ivm.page(AuditLog_page).webElement("ItemName").assertExist "True"
ivm.page(AuditLog_page).webElement("ItemName").assertStatus "Visible"

ivm.page(AuditLog_page).webElement("ItemType").assertExist "True"
ivm.page(AuditLog_page).webElement("ItemType").assertStatus "Visible"

ivm.page(AuditLog_page).webLink("Admin").assertExist "True"
ivm.page(AuditLog_page).webLink("Admin").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_TableView_Validate_ViewDetailsLinks", "AAA_AUL_TC_016"
