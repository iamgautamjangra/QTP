'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_SelectAdvertisementandProgramDetails_ValidatePageControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   10-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_SelectAdvertisementandProgramDetails_ValidatePageControls", "SCR_NEW_APD_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testcasedata.getvalue("ReportName")

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									 wait 8
									
									.webElement("Parameters").assertExist "True"
									.webElement("Parameters").assertStatus "Visible"
									
									.webElement("IncludeDataFrom").assertExist "True"
									.webElement("IncludeDataFrom").assertStatus "Visible"
									
									.webRadiogroup("Site_SiteGroup").assertSelectedItem "Sites"
									
									.webRadiogroup("Sites").assertExist "True"
									.webRadiogroup("Sites").assertStatus "Visible"
									
									.webElement("Sites").assertExist "True"
									.webElement("Sites").assertStatus "Visible"
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									
									.webRadiogroup("SiteGroups").assertExist "True"
									.webRadiogroup("SiteGroups").assertStatus "Visible"
									
									.webElement("SiteGroups").assertExist "True"
									.webElement("SiteGroups").assertStatus "Visible"
									.webEdit("SiteGroups").assertExist "True"
									.webEdit("SiteGroups").assertStatus "Visible"
									.webEdit("SiteGroups").assertValue "Type to search..."
									
									.webElement("ProviderIDs").assertExist "True"
									.webElement("ProviderIDs").assertStatus "Visible"
									.webEdit("ProviderIDs").assertExist "True"
									.webEdit("ProviderIDs").assertStatus "Visible"
									
									.webElement("Campaigns").assertExist "True"
									.webElement("Campaigns").assertStatus "Visible"
									.webEdit("Campaigns").assertExist "True"
									.webEdit("Campaigns").assertStatus "Visible"
									
									REM .webElement("Grouping").assertExist "True"
									REM .webElement("Grouping").assertStatus "Visible"
									REM .webList("Grouping").assertExist "True"
									REM .webList("Grouping").assertStatus "Visible"
									
									.webElement("ScheduleOptions").assertExist "True"
									.webElement("ScheduleOptions").assertStatus "Visible"
									
									.webElement("Frequency").assertExist "True"
									.webElement("Frequency").assertStatus "Visible"
									.webEdit("Frequency").assertExist "True"
									.webEdit("Frequency").assertStatus "Visible"
									
									.webElement("ScheduleTime").assertExist "True"
									.webElement("ScheduleTime").assertStatus "Visible"
									.webEdit("ScheduleTime").assertExist "True"
									.webEdit("ScheduleTime").assertStatus "Visible"
									
									.webImage("Watch").assertExist "True"
									.webImage("Watch").assertStatus "Visible"
									
									.webElement("IncludeDataFromLast").assertExist "True"
									.webElement("IncludeDataFromLast").assertStatus "Visible"
									.webEdit("IncludeDataFromLast").assertExist "True"
									.webEdit("IncludeDataFromLast").assertStatus "Visible"
									
									.webEdit("Duration").assertExist "True"
									.webEdit("Duration").assertStatus "Visible"
									
									REM .webElement("AutomaticExport").assertExist "True"
									REM .webElement("AutomaticExport").assertStatus "Visible"
									
									
									
									REM .webCheckBox("GenerateRepForNoData").assertExist "True"
									REM .webElement("GenerateRepForNoData").assertExist "True"
									
									.webElement("EmailAndStorage").assertExist "True"
									.webElement("EmailAndStorage").assertStatus "Visible"

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
									
									.webElement("Format").assertExist "True"
									.webElement("Format").assertStatus "Visible"
									.webEdit("Format").assertExist "True"
									.webEdit("Format").assertStatus "Visible"
									
									.webCheckBox("CompressFile").assertExist "True"
									.webCheckBox("CompressFile").assertStatus "Visible"
									.webElement("CompressFile").assertExist "Visible"
									.webElement("CompressFile").assertStatus "Visible"
									
									.webElement("DataType").assertExist "True"
									.webElement("DataType").assertStatus "Visible"
									.webEdit("DataType").assertExist "True"
									.webEdit("DataType").assertStatus "Visible"
									
									
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

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_SelectAdvertisementandProgramDetails_ValidatePageControls", "SCR_NEW_APD_TC_001"

