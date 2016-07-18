'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Test7_AuditLogs_Validate_TableView_Content
' Description					:	Validate the Content of Audit table with database
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Test7_AuditLogs_Validate_TableView_Content", "AAA_AUL_TC_007"

 'UI of Audit Log
ivm.page(Common_page).webLink("AuditLog").press	
wait wait20				

ivm.page(AuditLog_page).webTable("AuditLog").assertTableData grdAuditLogs,""

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Test7_AuditLogs_Validate_TableView_Content", "AAA_AUL_TC_007"

