'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_ScheduleOptions_InvalidScheduleSpecified
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_ScheduleOptions_InvalidScheduleSpecified", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testCaseData.getValue("SearchVal")
strScheduleDate=testCaseData.getValue("strScheduleDate")
strEndDate=testCaseData.getValue("strEndDate")

with ivm.page(ScheduledReports_Page)
			
				
									.webTable("ScheduledReports").selectRow SearchVal
									 wait 10
									
									
									.selectDate "ScheduleDate", strScheduleDate
									
									.selectDate "EndDate", strEndDate
									
									.webButton("SaveChanges").press
									wait 3
									
									.webElement("EndDateMoreThanSchedule").assertExist "True"
									.webElement("EndDateMoreThanSchedule").assertStatus "Visible"
									.webElement("EndDateMoreThanSchedule").assertText "Last Date must not be greater than schedule date."
									
									.webList("Frequency").selectItem "Repeat Monthly"
									.webButton("SaveChanges").press
									wait 3
									.webElement("SelectNull").assertExist "True"
									.webElement("SelectNull").assertStatus "Visible"
									.webElement("SelectNull").assertText "Select Days of Month is required."
									
									.webList("Frequency").selectItem "Repeat Weekly"
									.webButton("SaveChanges").press
									wait 3
									.webElement("SelectWeek").assertExist "True"
									.webElement("SelectWeek").assertStatus "Visible"
									.webElement("SelectWeek").assertText "Select Days of Week is required."
									
									
end with

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_ScheduleOptions_InvalidScheduleSpecified", "SCR_NEW_RDR_TC_001"

