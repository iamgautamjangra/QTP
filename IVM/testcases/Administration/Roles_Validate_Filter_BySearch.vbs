'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Test2_Roles_Validate_Filter_BySearch
' Description					:	Validate Role Page with its Filter_BySearch functionality 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Filter_BySearch", "AAA_ATH_TC_002"


strSearchValid=testcasedata.getvalue("SearchValid")
strSearchBlank=testcasedata.getvalue("SearchBlank")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press

'Validate for valida data
ivm.page(Common_page).webEdit("Search").setValue strSearchValid	
ivm.page(Common_page).webButton("Go").press

'Validating value from Role Table
ivm.page(Roles_page).webTable("Roles").searchdata strSearchValid

ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"

ivm.page(Common_page).webLink("SearchTerm").assertExist "True"
ivm.page(Common_page).webLink("SearchTerm").assertStatus "Visible"

ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"

ivm.page(Common_page).webLink("ClearAllSearch").press

ivm.page(Roles_page).webElement("Roles").assertExist "True"
ivm.page(Roles_page).webElement("Roles").assertStatus "Visible"


ivm.page(Common_page).webEdit("Search").setValue strSearchBlank	
ivm.page(Common_page).webButton("Go").press
ivm.page(Roles_page).webElement("Roles").assertExist "True"
ivm.page(Roles_page).webElement("Roles").assertStatus "Visible"

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_BySearch", "AAA_ATH_TC_002"