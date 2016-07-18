'
' File Name						:	GlobalSettings_Edit_BackToPreviousPage_Select
' Description					:	Validate the "Back To Previous Page" link on edit page of the Global Settings page
' Author 						:   Fonantrix Solution
' Date 							:   06-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_BackToPreviousPage_Select", "ADMN_GS_TC_07"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait 10
'Validating the default page tabs.
With ivm.page(GlobalSettings_page)
	.webLink("EditSettings").press
	 
	 wait(5)
	
	.webLink("BackToPreviousPage").assertExist "True"
	.webLink("BackToPreviousPage").assertStatus "Visible"
	.webLink("BackToPreviousPage").press
	
	wait(5)
	
	.webLink("EditSettings").assertExist "True"
	.webLink("EditSettings").assertStatus "Visible"
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_BackToPreviousPage_Select", "ADMN_GS_TC_07"
