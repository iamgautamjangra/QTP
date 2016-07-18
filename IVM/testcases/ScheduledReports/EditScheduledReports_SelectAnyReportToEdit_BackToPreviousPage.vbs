'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_BackToPreviousPage
' Description					:	Validate the Schedule Options Report Format.
' Author 						:   SeaChange
' Date 							:   22-08-2012
''--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_BackToPreviousPage", "SCR_New_TC_011"


SearchVal=testcaseData.getValue("SearchVal")

ivm.ClickToMenu MENU_SCHEDULED_REPORTS
wait 10

with ivm.page(ScheduledReports_Page)
			.webTable("ScheduledReports").selectRow SearchVal
			wait 10
			.webLink("BackToPrevious").assertStatus "Visible"
			.webLink("BackToPrevious").assertExist "True"
			.webLink("BackToPrevious").press
			
			wait 5
			
			.webTable("ScheduledReports").assertExist "True"
			.webTable("ScheduledReports_Header").assertExist "True"
			
end with
'Stop Test Case
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_BackToPreviousPage", "SCR_New_TC_011"