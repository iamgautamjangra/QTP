'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AuditLogs_Validate_Filter_BySearch
' Description					:	Validate Filter by Search option of Audit Log page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AuditLogs_Validate_Filter_BySearch", " AAA_AUL_TC_002"
 
 
strSearchValid=testcasedata.getvalue("SearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

ivm.page(Common_page).webLink("Administration").press
wait wait5
ivm.page(User_page).webLink("UserManager").press
wait wait5
ivm.page(Common_page).webLink("AuditLog").press	
wait wait5

ivm.page(AuditLog_page).webEdit("Search").setValue strSearchValid	
ivm.page(Common_page).webButton("Go").press
wait wait5
ivm.page(AuditLog_page).webElement("SearchCriteria").assertExist "True"
ivm.page(AuditLog_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(AuditLog_page).webTable("AuditLog").searchdata strSearchValid
ivm.page(AuditLog_page).webLink("SearchTerm").assertExist "True"
ivm.page(AuditLog_page).webLink("SearchTerm").assertStatus "Visible"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"

ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5

ivm.page(AuditLog_page).webEdit("Search").setValue strSearchBlank	
ivm.page(Common_page).webButton("Go").press
wait wait5

ivm.page(AuditLog_page).webElement("SearchCriteria").assertStatus "False"
ivm.page(AuditLog_page).webElement("AuditLog").assertExist "True"
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"



'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AuditLogs_Validate_Filter_BySearch", " AAA_AUL_TC_002"






