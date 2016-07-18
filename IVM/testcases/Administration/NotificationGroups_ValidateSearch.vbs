'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_ValidateSearch
' Description					:	Validate NotificationGroups  with its Filter_BySearch functionality 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "NotificationGroups_ValidateSearch", "ALC_NGP_TC_002"
	
ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strSearchValid=testcasedata.getvalue("SearchValid")
strSearchBlank=testcasedata.getvalue("SearchBlank")

'ivm.page(Login_page).webEdit("Username").setValue strUsername
'ivm.page(Login_page).webEdit("Password").setValue strPassword
'ivm.page(Login_page).webLink("LogIn").press


'Validate for valida data
ivm.page(Common_page).webEdit("Search").setValue strSearchValid	
ivm.page(Common_page).webButton("Go").press
wait 3
'Validating value from Role Table
ivm.page(Common_page).webTable("NotificationGroups").searchdata strSearchValid

ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"

ivm.page(Common_page).webElement("SearchTerm").assertExist "True"
ivm.page(Common_page).webElement("SearchTerm").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchTerm").assertText "Search Term" & " = " & strSearchValid

ivm.page(Common_page).webLink("ClearAll").assertExist "True"
ivm.page(Common_page).webLink("ClearAll").assertStatus "Visible"

ivm.page(Common_page).webLink("ClearAll").press
wait 3
ivm.page(Common_page).webElement("SearchTerm").assertExist "False"
'ivm.page(Common_page).webLink("ClearAll").assertExist "False"

'---DataBase Validation for the Search grid--No Filter Criteria

ivm.page(Common_page).webEdit("Search").setValue strSearchBlank	
ivm.page(Common_page).webButton("Go").press
wait 3
ivm.page(Common_page).webElement("SearchTerm").assertExist "False"
'ivm.page(Common_page).webLink("ClearAll").assertStatus "Visible"


'---DataBase Validation for the Search grid--No Filter Criteria

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_ValidateSearch", "ALC_NGP_TC_002"


