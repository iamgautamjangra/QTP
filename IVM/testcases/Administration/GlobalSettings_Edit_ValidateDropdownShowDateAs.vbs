'
' File Name						:	GlobalSettings_Edit_ValidateDropdownShowDateAs
' Description					:	Validate "Show date as" dropdown of Global Settings Edit page
' Author 						:   Fonantrix Solution
' Date 							:   06-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_ValidateDropdownShowDateAs", "ADMN_GS_TC_05"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait Wait5
'Validating the default page tabs.
With ivm.page(GlobalSettings_page)
		
	.webLink("EditSettings").press
	wait 3
	.webList("ShowDate").assertExist "True"
	.webList("ShowDate").assertStatus "Visible"
	.webList("ShowDate").assertListItems "Show Date"
	wait 3
	
	
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_ValidateDropdownShowDateAs", "ADMN_GS_TC_05"
