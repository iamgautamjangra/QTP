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



 ivm.ClickToMenu MENU_SCHEDULED_REPORTS
  wait 10
  
with ivm.page(ScheduledReports_Page)


			.webLink("ScheduleNewReport").press
			wait 5
			.webLink("BackToPrevious").assertStatus "Visible"
			.webLink("BackToPrevious").assertExist "True"
			.webLink("BackToPrevious").press
			
			wait 5
			
			.webTable("ScheduledReports").assertExist "True"
			.webTable("ScheduledReports_Header").assertExist "True"
			
			

end with
'Stop Test Case
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_BackToPreviousPage", "SCR_New_TC_011"