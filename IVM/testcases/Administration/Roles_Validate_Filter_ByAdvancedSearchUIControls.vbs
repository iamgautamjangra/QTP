'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Filter_ByAdvancedSearchUIControls
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvancedSearchUIControls", "AAA_ATH_TC_003"
	

'Validate labels

ivm.NavigateToMenu MENU_ROLES
wait 10
with ivm.page(Roles_page)
                     .webLink("Roles").press
                     .webLink("AdvanceSearch").press
'Validate UI
                     .webElement("AdvSearchTerm").assertStatus "Visible"
                     .webElement("AdvSearchTerm").assertExist "True"
                     .webEdit("AdvSearchTerm").assertStatus "Visible"
                     .webEdit("AdvSearchTerm").assertExist "True"

                     .webElement("SearchRoleName").assertStatus "Visible"
                     .webElement("SearchRoleName").assertExist "True"
                     .webEdit("SearchRoleName").assertStatus "Visible"
                     .webEdit("SearchRoleName").assertExist "True"

                     .webElement("LastUpdated").assertStatus "Visible"
                     .webElement("LastUpdated").assertExist "True"
                     .webEdit("LastUpdated").assertStatus "Visible"
                     .webEdit("LastUpdated").assertExist "True"

                     .webElement("Location").assertStatus "Visible"
                     .webElement("Location").assertExist "True"
                     .webEdit("Location").assertStatus "Visible"
                     .webEdit("Location").assertExist "True"

                     .webImage("LastUpdated").assertStatus "Visible"
                     .webImage("LastUpdated").assertExist "True"

                     .webLink("AdvSearch").assertStatus "Visible"
                     .webLink("AdvSearch").assertExist "True"

                     .webLink("AdvCancel").assertStatus "Visible"
                     .webLink("AdvCancel").assertExist "True"

                     .webLink("AdvClearAll").assertStatus "Visible"
                     .webLink("AdvClearAll").assertExist "True"
                     .webLink("AdvClearAll").press
					 .webLink("AdvCancel").press
					 wait Wait5
End With					 
'=============================================================================================
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvancedSearchUIControls", "AAA_ATH_TC_003"

