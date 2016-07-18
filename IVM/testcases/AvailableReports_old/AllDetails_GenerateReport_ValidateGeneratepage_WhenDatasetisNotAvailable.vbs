'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate AllDetails report" with no available data set.			
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_ADR_TC_004"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10


With ivm.page(report_page)
									
									
									.webTable("AvailableReports").presstblLink reportAllDetails,3
									wait Wait5

									
									.webElement("FilterOptions_Expand").press
									wait wait2
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
									
									
									
									.webElement("EmailAndStorageOptions_Expand").press
									wait wait2
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg
									
									
									.webElement("Comments_Expand").press
									wait wait2
									
									.webEdit("TimeRange").assertExist "False"
									.webEdit("Campaigns").assertExist "False"
									
									
End with				         
		         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetails_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_ADR_TC_004"