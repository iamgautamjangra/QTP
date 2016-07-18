'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_SelectVODAdDeliveryDataFeed_ValidatePageControls
' Description					:	Validate the Page Controls of the Report.
' Author 						:   SeaChange
' Date 							:   02-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_SelectVODAdDeliveryDataFeed_ValidatePageControls", "SCR_NEW_VOD_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait25


with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									  wait Wait15
									
									.webRadiogroup("ReportType").selectGroupItem reportVODAdDeliveryDataFeed
									 wait Wait8
									
									.webElement("Parameters").assertExist "True"
									.webElement("Parameters").assertStatus "Visible"
									wait Wait2
									.webList("FirstDate").assertExist "True"
									.webList("FirstDate").assertStatus "Visible"
									
									.webList("FirstDate").assertSelectedItem "Date"
									
									.webElement("FirstDate").assertExist "True"
									.webElement("FirstDate").assertStatus "Visible"
									wait Wait2
									.webEdit("FirstDate").assertExist "True"
									.webEdit("FirstDate").assertStatus "Visible"
									.webEdit("FirstDate").assertValue "dd-mm-yyyy"
									wait Wait2
									.webImage("FirstDate").assertExist "True"
									.webImage("FirstDate").assertStatus "Visible"
									wait Wait2
									
									.webList("LastDate").assertExist "True"
									.webList("LastDate").assertStatus "Visible"
									.webList("LastDate").assertSelectedItem "Date"
									wait Wait2
									.webElement("LastDate").assertExist "True"
									.webElement("LastDate").assertStatus "Visible"
									wait Wait2
									.webEdit("LastDate").assertExist "True"
									.webEdit("LastDate").assertStatus "Visible"
									.webEdit("LastDate").assertValue "dd-mm-yyyy"
									
									.webImage("LastDate").assertExist "True"
									.webImage("LastDate").assertStatus "Visible"
									wait Wait2
									.webElement("ScheduleOptions").assertExist "True"
									.webElement("ScheduleOptions").assertStatus "Visible"
									
									.webRadiogroup("GenerateOption").assertExist "True"
									.webRadiogroup("GenerateOption").assertStatus "Visible"
								    wait Wait2 
									.webElement("GenerateReportNow").assertExist "True"
									.webElement("GenerateReportNow").assertStatus "Visible"
									
									.webRadiogroup("GenerateOption").selectGroupItem "generateOnSchedule"
									wait Wait5
									.webElement("GenerateReportOnDate").assertExist "True"
									
									.webElement("GenerateReportOnDate").assertStatus "Visible"
									wait Wait2
									
									.webElement("ScheduleDate").assertExist "True"
									.webElement("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertExist "True"
									.webEdit("ScheduleDate").assertStatus "Visible"
									.webEdit("ScheduleDate").assertValue "dd-mm-yyyy"
									wait Wait2
									.webElement("Time").assertExist "True"
									.webElement("Time").assertStatus "Visible"
									.webEdit("Time").assertExist "True"
									.webEdit("Time").assertStatus "Visible"
									.webEdit("Time").assertValue "00:00"
									wait Wait2
									.webImage("Watch").assertExist "True"
									.webImage("Watch").assertStatus "Visible"
									wait Wait2
									.webList("Frequency").assertExist "True"
									.webList("Frequency").assertStatus "Visible"
									wait Wait2
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									wait Wait2
									.webElement("EmailAndStorageOptions").assertExist "True"
									.webElement("EmailAndStorageOptions").assertStatus "Visible"
                                     wait Wait2
									.webElement("EmailRecipients").assertExist "True"
									.webElement("EmailRecipients").assertStatus "Visible"
									.webEdit("EmailRecipients").assertExist "True"
									.webEdit("EmailRecipients").assertStatus "Visible"
									wait Wait2
									.webButton("AddRecipient").assertExist "True"
									.webButton("AddRecipient").assertStatus "Visible"
									wait Wait2
									.webElement("StorageLocation").assertExist "True"
									.webElement("StorageLocation").assertStatus "Visible"
									.webEdit("StorageLocation").assertExist "True"
									.webEdit("StorageLocation").assertStatus "Visible"
									wait Wait2
									.webElement("ReportFormat").assertExist "True"
									.webElement("ReportFormat").assertStatus "Visible"
									.webList("ReportFormat").assertExist "True"
									.webList("ReportFormat").assertStatus "Visible"
									wait Wait2
									
									.webCheckBox("CompressTheFile").assertExist "True"
									.webCheckBox("CompressTheFile").assertStatus "Visible"
									.webElement("CompressTheFile").assertExist "True"
									.webElement("CompressTheFile").assertStatus "Visible"
									wait Wait2
									
									.webElement("Comments").assertExist "True"
									.webElement("Comments").assertStatus "Visible"
									.webEdit("Comments").assertExist "True"
									.webEdit("Comments").assertStatus "Visible"
									wait Wait2
									.webButton("Schedule").assertExist "True"
									.webButton("Schedule").assertStatus "Visible"
									wait Wait2
									.webButton("Cancel").assertExist "True"
									.webButton("Cancel").assertStatus "Visible"
									wait Wait2
									.webButton("Cancel").press			
			
									wait Wait5
								
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_SelectVODAdDeliveryDataFeed_ValidatePageControls", "SCR_NEW_VOD_TC_001"

