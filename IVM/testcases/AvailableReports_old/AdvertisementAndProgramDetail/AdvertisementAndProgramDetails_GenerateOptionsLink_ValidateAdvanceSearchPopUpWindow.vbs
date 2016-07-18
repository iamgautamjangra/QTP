'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_GenerateOptionsLink_ValidateAdvanceSearchPopUpWindow
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateOptionsLink_ValidateAdvanceSearchPopUpWindow", "REP_APD_TC_005"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
						wait 10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait 2
						
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateOptionsLink_ValidateAdvanceSearchPopUpWindow", "REP_APD_TC_005"			
