'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	IVMApp_Administration_AuditLogs_MenuSelection_ValidateAuditLogPageControls
' Description					:	Validate UI of Audit Log page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 
 executionController.startTestCase_w_TestCaseNumber "IVMApp_Administration_AuditLogs_MenuSelection_ValidateAuditLogPageControls", "AAA_AUL_TC_001"

 'UI of Audit Log
ivm.page(Common_page).webLink("AuditLog").press					

ivm.page(AuditLog_page).webElement("AuditLog").assertExist "True"
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"
 
ivm.page(AuditLog_page).webLink("ExportLog").assertExist "True"
ivm.page(AuditLog_page).webLink("ExportLog").assertStatus "Visible"		

ivm.page(Common_page).webEdit("Search").assertExist "True"
ivm.page(Common_page).webEdit("Search").assertStatus "Visible"  

ivm.page(Common_page).webLink("AdvancedSearch").assertExist "True"
ivm.page(Common_page).webLink("AdvancedSearch").assertStatus "Visible"  	

'validate Column sort
ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "Date",True
ivm.page(AuditLog_page).webTable("AuditLog").assertTblLink "Date",1

ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "User",True
ivm.page(AuditLog_page).webTable("AuditLog").assertTblLink "User",2

ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "User Action",True
ivm.page(AuditLog_page).webTable("AuditLog").assertTblLink "User Action",3

ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "Item Type",True
ivm.page(AuditLog_page).webTable("AuditLog").assertTblLink "Item Type",4

ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "Item Name",True
ivm.page(AuditLog_page).webTable("AuditLog").assertTblLink "Item Name",5

ivm.page(AuditLog_page).webTable("AuditLog").assertColumnExist "Actions",True

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Administration_AuditLogs_MenuSelection_ValidateAuditLogPageControls", "AAA_AUL_TC_001"

