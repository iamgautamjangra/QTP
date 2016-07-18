'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_GenerateReport_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate Campaign Summary report" with available data set.
' Author 						:   SeaChange
' Date 							:   01-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateUiControlsWithAvailableDataset", "SCR_NEW_CSR_TC_005"

'DataSet=testcasedata.getvalue("DataSet")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15

DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)
							
						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						wait Wait8
						.webLink("AdvancedSearch").press
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait8
						
						
							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							
							If status=False Then
							
								Browser("SeaChangeManagementConsole").Refresh
								wait wait8
								.webLink("AdvancedSearch").press
								 wait Wait8
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								wait wait8
							End if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1
						
						wait Wait5
						
						.webElement("TimeRange").assertExist "True"
									
						.webElement("TimeRange").assertStatus "Visible"
									
						.webEdit("TimeRange").assertExist "True"
									
						.webEdit("TimeRange").assertStatus "Visible"
						
						.webElement("CampaignNames").assertExist "True"
									
						.webElement("CampaignNames").assertStatus "Visible"
									
						.webEdit("CampaignNames").assertExist "True"
									
						.webEdit("CampaignNames").assertStatus "Visible"						
						
						.webElement("EmailRecipients").assertExist "True"
									
						.webElement("EmailRecipients").assertStatus "Visible"
									
						.webEdit("EmailRecipients").assertExist "True"
									
						.webEdit("EmailRecipients").assertStatus "Visible"
									
						.webButton("AddRecipients").assertExist "True"
									
						.webButton("AddRecipients").assertStatus "Visible"
									
						.webElement("StorageLocation").assertExist "True"
									
						.webElement("StorageLocation").assertStatus "Visible"
									
						.webEdit("StorageLocation").assertExist "True"
									
						.webEdit("StorageLocation").assertStatus "Visible"
									
						.webElement("ReportFormat").assertExist "True"
									
						.webElement("ReportFormat").assertStatus "Visible"
									
						.webList("ReportFormat").assertExist "True"
									
						.webList("ReportFormat").assertStatus "Visible"
									
						.webCheckbox("CompressTheFile").assertExist "True"
									
						.webCheckbox("CompressTheFile").assertStatus "Visible"
									
						.webElement("CompressTheFile").assertExist "True"
									
						.webElement("CompressTheFile").assertStatus "Visible"
									
						.webElement("DataType").assertExist "True"
									
						.webElement("DataType").assertStatus "Visible"
						
						.webList("DataType").assertExist "True"
									
						.webList("DataType").assertStatus "Visible"
									
						.webElement("TypeInComments").assertExist "True"
									
						.webElement("TypeInComments").assertStatus "Visible"
									
						
						.webElement("Comments").assertExist "True"
									
						.webElement("Comments").assertStatus "Visible"
									
						.webButton("Generate").assertStatus "Enable"
End with						         



executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateUiControlsWithAvailableDataset", "SCR_NEW_CSR_TC_005"