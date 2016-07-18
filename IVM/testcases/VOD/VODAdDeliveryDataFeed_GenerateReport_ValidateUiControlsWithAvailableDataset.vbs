'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate VOD Ad Delivery Data Feed report" with available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset", "REP_CSR_TC_004"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

strSeachValue=testcasedata.getvalue("strSeachValue")
strReportFormat=testcasedata.getvalue("strReportFormat")
strProvider=testcasedata.getvalue("strProvider")

DataSet=DATASET_VODADDELIVERYDATAFEED

 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						wait Wait10
						.webLink("AdvancedSearch").press
						wait Wait3
								
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
						Browser("SeaChangeManagementConsole").Refresh
						wait wait8
						.webLink("AdvancedSearch").press
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait8
						end if
						.webTable("DataSet").presstblRadioBtn DataSet,1
										
						wait Wait10
									
						
						
						.webElement("TimeRange").assertExist "True"
									
						.webElement("TimeRange").assertStatus "Visible"
									
						.webEdit("TimeRange").assertStatus "Visible"
						
						.webEdit("TimeRange").assertExist "True"
						
						.webElement("Provider").assertExist "True"
									
						.webElement("Provider").assertStatus "Visible"
									
						.webList("Provider").assertExist "True"
									
						.webList("Provider").assertSelectedItem strProvider
						
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
									
																	
									.webElement("TypeInComments").assertExist "True"
									
									.webElement("TypeInComments").assertStatus "Visible"
									
									
									.webElement("Comments").assertExist "True"
									
									.webElement("Comments").assertStatus "Visible"
									
									.webButton("Generate").assertStatus "Enable"
End with						         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset", "REP_CSR_TC_004"