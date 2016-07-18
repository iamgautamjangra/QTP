'
' File Name						:	GlobalSettings_Edit_ValidateDropdownShowTimeIn
' Description					:	Validate "Show time in" dropdown of Global Settings Edit page
' Author 						:   Fonantrix Solution
' Date 							:   06-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_ValidateDropdownShowTimeIn", "ADMN_GS_TC_06"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait Wait5
'Validating the default page tabs.
With ivm.page(GlobalSettings_page)
	.webLink("EditSettings").press
	.webList("ShowTime").assertExist "True"
	.webList("ShowTime").assertStatus "Visible"
	.webList("ShowTime").assertListItems  "Show Time"
	
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_ValidateDropdownShowTimeIn", "ADMN_GS_TC_06"
