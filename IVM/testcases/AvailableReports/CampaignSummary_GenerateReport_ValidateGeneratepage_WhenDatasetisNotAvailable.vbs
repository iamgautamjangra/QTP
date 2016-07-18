'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate the Data sets Parameters values displayed in Data set table page.
' Author 						:   Fonantrix Solution
' Date 							:   01-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "SCR_NEW_CSR_TC_003"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait20


With ivm.page(report_page)
									
									
									.webTable("AvailableReports").presstblLink reportCampaignSummary,3
									wait Wait10
									
																	
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
									
									.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
									
									
									.webElement("FilterOptions_Expand").press
									
									.webElement("FilterOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptions_Expand").press
	
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
									.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg
								
									

									.webElement("EmailAndStorageOptions_Expand").press
									
									.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
									
									.webElement("Comments_Expand").press
																		
									.webEdit("TimeRange").assertExist "False"
									.webEdit("Campaigns").assertExist "False"
								
									
									
End with						         
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateGeneratepage_WhenDatasetisNotAvailable", "SCR_NEW_CSR_TC_003"