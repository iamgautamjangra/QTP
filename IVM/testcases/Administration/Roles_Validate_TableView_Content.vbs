'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_TableView_Content
' Description					:	Validate  the table content  of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_TableView_Content", "AAA_ATH_TC_006"


'**************Validate the table content of Roles page with the DATABASE****************
ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press

ivm.page(Roles_page).webTable("Roles").assertTableData grdRoles, ""

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_TableView_Content", "AAA_ATH_TC_006"
