'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ViewAuditLogDetails_Select_BackToPreviousPageLink
' Description					:	Validate the "Back to Previous Page" link in "View Audit Log Details" page.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "ViewAuditLogDetails_Select_BackToPreviousPageLink", "AAA_AUL_TC_017"
 
 	
ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Common_page).webLink("AuditLog").press
wait wait10

strViewlink=testcasedata.getvalue("strViewlink")

ivm.page(AuditLog_page).webTable("AuditLog").pressTblLink strViewlink,6
wait wait10
ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"

ivm.page(Common_page).webLink("BackToPreviousPage").press
wait wait10
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ViewAuditLogDetails_Select_BackToPreviousPageLink", "AAA_AUL_TC_017"

