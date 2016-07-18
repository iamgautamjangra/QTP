'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ScheduleOptions_InvalidScheduleSpecified
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_InvalidScheduleSpecified", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testCaseData.getValue("ReportName")
strScheduleDate=testCaseData.getValue("strScheduleDate")
strEndDate=testCaseData.getValue("strEndDate")

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
									
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									wait 8
									.webList("Frequency").selectItem "Repeat Daily"
									wait 5
									.webButton("Schedule").press
									
									wait 3
									.webElement("ScheduleDateIsRequired").assertExist "True"
									.webElement("ScheduleDateIsRequired").assertStatus "Visible"
									.webElement("ScheduleDateIsRequired").assertText "Schedule Date is required."
									
									.webElement("EmailIsRequired").assertExist "True"
									.webElement("EmailIsRequired").assertStatus "Visible"
									.webElement("EmailIsRequired").assertText "At least one e-mail address or storage location is required."
									
									
									.webElement("EndDateIsRequired").assertExist "True"
									.webElement("EndDateIsRequired").assertStatus "Visible"
									.webElement("EndDateIsRequired").assertText "End Date is required."
									wait 2
									.selectDate "ScheduleDate", strScheduleDate
									wait 2
									.selectDate "EndDate", strEndDate
									wait 2
									.webButton("Schedule").press
									wait 3
									.webElement("ScheduleDateMoreThanCurrentDate").assertExist "True"
									.webElement("ScheduleDateMoreThanCurrentDate").assertStatus "Visible"
									.webElement("ScheduleDateMoreThanCurrentDate").assertText "Schedule Date must be greater than or equal to current date."
									
									 wait 5
									.webList("Frequency").selectItem "Repeat Monthly"
									wait 2
									.webButton("Schedule").press
									wait 3
									.webElement("SelectAMonth").assertExist "True"
									.webElement("SelectAMonth").assertStatus "Visible"
									.webElement("SelectAMonth").assertText "Select Month is required."
									
									
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_InvalidScheduleSpecified", "SCR_NEW_RDR_TC_001"

