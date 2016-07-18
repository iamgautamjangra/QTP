'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_SelectEndOfCampaign_ValidatePageControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_SelectEndOfCampaign_ValidatePageControls", "SCR_NEW_EOC_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 20


with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
									 wait 8
									
									.webElement("Parameters").assertExist "True"
									.webElement("Parameters").assertStatus "Visible"
									
									
									.webList("FirstDate").assertExist "True"
									.webList("FirstDate").assertStatus "Visible"
									
									.webList("FirstDate").assertSelectedItem "Date"
																	
									
								    .webElement("FirstDate").assertExist "True"
									.webElement("FirstDate").assertStatus "Visible"
									wait 2
									.webEdit("FirstDate").assertExist "True"
									.webEdit("FirstDate").assertStatus "Visible"
									.webEdit("FirstDate").assertValue "dd-mm-yyyy"
									wait 2
									.webImage("FirstDate").assertExist "True"
									.webImage("FirstDate").assertStatus "Visible"
									wait 2
									
									.webList("LastDate").assertExist "True"
									.webList("LastDate").assertStatus "Visible"
									.webList("LastDate").assertSelectedItem "Date"
									
									.webElement("LastDate").assertExist "True"
									.webElement("LastDate").assertStatus "Visible"
									wait 2
									.webEdit("LastDate").assertExist "True"
									.webEdit("LastDate").assertStatus "Visible"
									.webEdit("LastDate").assertValue "dd-mm-yyyy"
									
									.webImage("LastDate").assertExist "True"
									.webImage("LastDate").assertStatus "Visible"
									wait 2
									
									.webElement("Sites").assertExist "True"
									.webElement("Sites").assertStatus "Visible"
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.webEdit("Sites").assertValue "Type to search..."
									
									.webRadiogroup("Site_SiteGroup").selectGroupItem "SiteGroups"
									
									wait Wait2
									
									
									.webElement("SiteGroups").assertExist "True"
									.webElement("SiteGroups").assertStatus "Visible"
									.webEdit("SiteGroups").assertExist "True"
									.webEdit("SiteGroups").assertStatus "Visible"
									.webEdit("SiteGroups").assertValue "Type to search..."
									
																		
									.webElement("Provider").assertExist "True"
									.webElement("Provider").assertStatus "Visible"
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									
									.webElement("Campaign").assertExist "True"
									.webElement("Campaign").assertStatus "Visible"
									.webEdit("Campaign").assertExist "True"
									.webEdit("Campaign").assertStatus "Visible"
									
									.webElement("GroupBy").assertExist "True"
									.webElement("GroupBy").assertStatus "Visible"
									.webList("GroupBy").assertExist "True"
									.webList("GroupBy").assertStatus "Visible"
									
									.webElement("ScheduleOptions").assertExist "True"
									.webElement("ScheduleOptions").assertStatus "Visible"
									
									.webRadiogroup("GenerateOption").assertExist "True"
									.webRadiogroup("GenerateOption").assertStatus "Visible"
								    wait 2 
									.webElement("GenerateReportNow").assertExist "True"
									.webElement("GenerateReportNow").assertStatus "Visible"
									
									.webRadiogroup("GenerateOption").selectGroupItem "generateOnSchedule"
									wait Wait5
									.webElement("GenerateReportOnDate").assertExist "True"
									
									.webElement("GenerateReportOnDate").assertStatus "Visible"
									wait 2
									
									.webElement("ScheduleDate").assertExist "True"
									.webElement("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertExist "True"
									.webEdit("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertValue "dd-mm-yyyy"
									wait 2
									.webElement("Time").assertExist "True"
									.webElement("Time").assertStatus "Visible"
									.webEdit("Time").assertExist "True"
									.webEdit("Time").assertStatus "Visible"
									.webEdit("Time").assertValue "00:00"
									wait 2
									.webImage("Watch").assertExist "True"
									.webImage("Watch").assertStatus "Visible"
									wait 2
									.webList("Frequency").assertExist "True"
									.webList("Frequency").assertStatus "Visible"
									wait 2
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									wait 2
									
									.webElement("EmailAndStorageOptions").assertExist "True"
									.webElement("EmailAndStorageOptions").assertStatus "Visible"
                                     wait 2
									.webElement("EmailRecipients").assertExist "True"
									.webElement("EmailRecipients").assertStatus "Visible"
									.webEdit("EmailRecipients").assertExist "True"
									.webEdit("EmailRecipients").assertStatus "Visible"
									wait 2
									.webButton("AddRecipient").assertExist "True"
									.webButton("AddRecipient").assertStatus "Visible"
									wait 2
									.webElement("StorageLocation").assertExist "True"
									.webElement("StorageLocation").assertStatus "Visible"
									.webEdit("StorageLocation").assertExist "True"
									.webEdit("StorageLocation").assertStatus "Visible"
									wait 2
									.webElement("ReportFormat").assertExist "True"
									.webElement("ReportFormat").assertStatus "Visible"
									.webList("ReportFormat").assertExist "True"
									.webList("ReportFormat").assertStatus "Visible"
									wait 2
									
									.webElement("DataType").assertExist "True"
									.webElement("DataType").assertStatus "Visible"
									.webList("DataType").assertExist "True"
									.webList("DataType").assertStatus "Visible"
									wait Wait5
									
									.webCheckBox("CompressTheFile").assertExist "True"
									.webCheckBox("CompressTheFile").assertStatus "Visible"
									.webElement("CompressTheFile").assertExist "True"
									.webElement("CompressTheFile").assertStatus "Visible"
									wait 2
									
									.webElement("Comments").assertExist "True"
									.webElement("Comments").assertStatus "Visible"
									.webEdit("Comments").assertExist "True"
									.webEdit("Comments").assertStatus "Visible"
									wait 2
									.webButton("Schedule").assertExist "True"
									.webButton("Schedule").assertStatus "Visible"
									wait 2
									.webButton("Cancel").assertExist "True"
									.webButton("Cancel").assertStatus "Visible"
									wait 2
									.webButton("Cancel").press			
			
									wait Wait5
			
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_SelectEndOfCampaign_ValidatePageControls", "SCR_NEW_EOC_TC_001"

