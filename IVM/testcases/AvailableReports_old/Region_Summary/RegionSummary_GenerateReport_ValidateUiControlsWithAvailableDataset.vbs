'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_GenerateReport_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate RegionSummary report" with available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_RSR_TC_005"

DataSet=testcasedata.getvalue("DataSet")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10


With ivm.page(report_page)
									
									
						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						wait 5
						.webTable("DataSet").presstblRadioBtn DataSet,1
						
						wait 10
						
						.webElement("TimeRange").assertExist "True"
									
						.webElement("TimeRange").assertStatus "Visible"
									
						.webEdit("TimeRange").assertExist "True"
									
						.webEdit("TimeRange").assertStatus "Visible"
						
						.webElement("CampaignNames").assertExist "True"
									
						.webElement("CampaignNames").assertStatus "Visible"
									
						.webEdit("CampaignNames").assertExist "True"
									
						.webEdit("CampaignNames").assertStatus "Visible"
						
						.webElement("ProgramPid").assertExist "True"
									
						.webElement("ProgramPid").assertStatus "Visible"
									
						.webEdit("ProgramPid").assertExist "True"
									
						.webEdit("ProgramPid").assertStatus "Visible"
						
						
						
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

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_RSR_TC_005"