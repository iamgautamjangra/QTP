'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduledReports_View_ValidateTableData_WithDGWAPI
' Description					:	Validate the Schedule Options Report Format.
' Author 						:   SeaChange
' Date 							:   22-08-2012
''--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduledReports_View_ValidateTableData_WithDGWAPI", "SCR_New_TC_011"



 ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
  wait 10
  
with ivm.page(ScheduledReports_Page)


			
			.webTable("ScheduledReports").assertTableData "ScheduledReports",""
			
			

end with
'Stop Test Case
executionController.stopTestCase_w_TestCaseNumber "ScheduledReports_View_ValidateTableData_WithDGWAPI", "SCR_New_TC_011"