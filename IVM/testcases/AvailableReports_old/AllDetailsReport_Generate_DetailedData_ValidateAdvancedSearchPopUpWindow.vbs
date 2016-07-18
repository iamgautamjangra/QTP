'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ADR_TC_006"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait Wait5
						
						.webElement("SearchTerm").assertExist "True"
						.webElement("SearchTerm").assertStatus "Visible"
						.webEdit("SearchTerm_Adv").assertExist "True"
						.webEdit("SearchTerm_Adv").assertStatus "Visible"
						.webEdit("SearchTerm_Adv").assertValue "Search..."
						
						.webElement("DataSetName").assertExist "True"
						.webElement("DataSetName").assertStatus "Visible"
						.webEdit("DataSetName").assertExist "True"
						.webEdit("DataSetName").assertStatus "Visible"
						
						.webElement("DatasetCreation").assertExist "True"
						.webElement("DatasetCreation").assertStatus "Visible"
						.webEdit("DatasetCreation").assertExist "True"
						.webEdit("DatasetCreation").assertStatus "Visible"
						
						.webElement("User").assertExist "True"
						.webElement("User").assertStatus "Visible"
						.webEdit("User").assertExist "True"
						.webEdit("User").assertStatus "Visible"
						
						.webLink("AdvSearch").assertExist "True"
						.webLink("AdvSearch").assertStatus "Visible"
						
						.webLink("AdvCancel").assertExist "True"
						.webLink("AdvCancel").assertStatus "Visible"
						
						.webLink("AdvClearAll").assertExist "True"
						.webLink("AdvClearAll").assertStatus "Visible"
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ADR_TC_006"			
