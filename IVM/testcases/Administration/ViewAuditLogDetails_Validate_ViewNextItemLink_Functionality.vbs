'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ViewAuditLogDetails_Validate_ViewNextItemLink_Functionality
' Description					:	Validate the functionality of  "ViewNext Item" link in "View Audit Log Details" page.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "ViewAuditLogDetails_Validate_ViewNextItemLink_Functionality", "AAA_AUL_TC_019"
 	

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Common_page).webLink("AuditLog").press

strViewlink=testcasedata.getvalue("strViewlink")

wait wait5
ivm.page(AuditLog_page).webTable("AuditLog").presstblLink strViewlink,6

wait wait10

ivm.page(AuditLog_page).webLink("ViewNextItem").assertExist "True"
ivm.page(AuditLog_page).webLink("ViewNextItem").assertStatus "Visible"

ivm.page(AuditLog_page).webLink("ViewNextItem").press

ivm.page(AuditLog_page).webElement("Date").assertExist "True"
ivm.page(AuditLog_page).webElement("Date").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ViewAuditLogDetails_Validate_ViewNextItemLink_Functionality", "AAA_AUL_TC_019"
