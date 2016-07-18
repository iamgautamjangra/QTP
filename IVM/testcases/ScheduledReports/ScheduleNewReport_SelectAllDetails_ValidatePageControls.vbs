'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_SelectAllDetails_ValidatePageControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_SelectAllDetails_ValidatePageControls", "SCR_NEW_ADR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportAllDetails
									 wait Wait8
									
									.webElement("Parameters").assertExist "True"
									.webElement("Parameters").assertStatus "Visible"
								
									.webList("FirstDate").assertExist "True"
									.webList("FirstDate").assertStatus "Visible"
									
									.webList("FirstDate").assertSelectedItem "Date"
									
									
									
									.webElement("FirstDate").assertExist "True"
									.webElement("FirstDate").assertStatus "Visible"
									
									.webEdit("FirstDate").assertExist "True"
									.webEdit("FirstDate").assertStatus "Visible"
									.webEdit("FirstDate").assertValue "dd-mm-yyyy"
									
									.webImage("FirstDate").assertExist "True"
									.webImage("FirstDate").assertStatus "Visible"
									
																		
									.webList("LastDate").assertExist "True"
									.webList("LastDate").assertStatus "Visible"
									.webList("LastDate").assertSelectedItem "Date"
									
									.webElement("LastDate").assertExist "True"
									.webElement("LastDate").assertStatus "Visible"
									
									.webEdit("LastDate").assertExist "True"
									.webEdit("LastDate").assertStatus "Visible"
									.webEdit("LastDate").assertValue "dd-mm-yyyy"
									
									.webImage("LastDate").assertExist "True"
									.webImage("LastDate").assertStatus "Visible"
									
									.selectDate "FirstDate", FIRST_DATE
									wait Wait3									
									.selectDate "LastDate", LAST_DATE
									 wait Wait3
									
																	
									.webElement("Campaign").assertExist "True"
									.webElement("Campaign").assertStatus "Visible"
									.webEdit("Campaign").assertExist "True"
									.webEdit("Campaign").assertStatus "Visible"
									
									.webElement("Provider").assertExist "True"
									.webElement("Provider").assertStatus "Visible"
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									
									.webElement("Sites").assertExist "True"
									.webElement("Sites").assertStatus "Visible"
									
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									
									
									.webElement("GroupBy").assertExist "True"
									.webElement("GroupBy").assertStatus "Visible"
									.webList("GroupBy").assertExist "True"
									.webList("GroupBy").assertStatus "Visible"
									
									.webElement("ScheduleOptions").assertExist "True"
									.webElement("ScheduleOptions").assertStatus "Visible"
									
									.webRadiogroup("GenerateOption").assertExist "True"
									.webRadiogroup("GenerateOption").assertStatus "Visible"
									
									.webElement("GenerateReportNow").assertExist "True"
									.webElement("GenerateReportNow").assertStatus "Visible"
									
									.webElement("GenerateReportOnDate").assertExist "True"
									.webElement("GenerateReportOnDate").assertStatus "Visible"
									
									
									.webElement("ScheduleDate").assertExist "True"
									.webElement("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertExist "True"
									.webEdit("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertValue "dd-mm-yyyy"
									
									.webElement("Time").assertExist "True"
									.webElement("Time").assertStatus "Visible"
									.webEdit("Time").assertExist "True"
									.webEdit("Time").assertStatus "Visible"
									.webEdit("Time").assertValue "00:00"
									
									.webImage("Watch").assertExist "True"
									.webImage("Watch").assertStatus "Visible"
									
									.webList("Frequency").assertExist "True"
									.webList("Frequency").assertStatus "Visible"
									
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									
									
									.webElement("EmailAndStorageOptions").assertExist "True"
									.webElement("EmailAndStorageOptions").assertStatus "Visible"

									.webElement("EmailRecipients").assertExist "True"
									.webElement("EmailRecipients").assertStatus "Visible"
									.webEdit("EmailRecipients").assertExist "True"
									.webEdit("EmailRecipients").assertStatus "Visible"
									
									.webButton("AddRecipient").assertExist "True"
									.webButton("AddRecipient").assertStatus "Visible"
									
									.webElement("StorageLocation").assertExist "True"
									.webElement("StorageLocation").assertStatus "Visible"
									.webEdit("StorageLocation").assertExist "True"
									.webEdit("StorageLocation").assertStatus "Visible"
									
									.webElement("ReportFormat").assertExist "True"
									.webElement("ReportFormat").assertStatus "Visible"
									.webList("ReportFormat").assertExist "True"
									.webList("ReportFormat").assertStatus "Visible"
									
									.webElement("DataType").assertExist "True"
									.webElement("DataType").assertStatus "Visible"
									.webList("DataType").assertExist "True"
									.webList("DataType").assertStatus "Visible"
									
									.webCheckBox("CompressTheFile").assertExist "True"
									.webCheckBox("CompressTheFile").assertStatus "Visible"
									.webElement("CompressTheFile").assertExist "True"
									.webElement("CompressTheFile").assertStatus "Visible"
									
									
									.webElement("Comments").assertExist "True"
									.webElement("Comments").assertStatus "Visible"
									.webEdit("Comments").assertExist "True"
									.webEdit("Comments").assertStatus "Visible"
									
									.webButton("Schedule").assertExist "True"
									.webButton("Schedule").assertStatus "Visible"
									
									.webButton("Cancel").assertExist "True"
									.webButton("Cancel").assertStatus "Visible"
									
									.webButton("Cancel").press			
			
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_SelectAllDetails_ValidatePageControls", "SCR_NEW_ADR_TC_001"

