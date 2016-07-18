'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduledReports_SelectAnyReportToDelete_ValidateUI
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduledReports_SelectAnyReportToDelete_ValidateUI", "SCR_NEW_RDR_TC_001"

SearchVal=testcaseData.getValue("SearchVal")
ReportName=testcaseData.getValue("ReportName")

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

with ivm.page(ScheduledReports_Page)
			
				
									.webTable("ScheduledReports").selectRow ReportName &";"& SearchVal &";"&"Delete"
									wait 7
									.webElement("DeleteScheduledReport").assertExist "True"
									.webElement("DeleteScheduledReport").assertStatus "Visible"
									wait 5
									.webElement("DeleteMessage").assertExist "True"
									.webElement("DeleteMessage").assertStatus "Visible"
									.webElement("DeleteMessage").assertText "The "& ReportName &" report is scheduled to run "& SearchVal &". Are you sure you want to delete this scheduled report?"
									.webButton("Delete").assertExist "True"
									.webButton("Delete").assertStatus "Visible"
									.webButton("Cancel").assertExist "True"
									.webButton("Cancel").assertStatus "Visible"
									
									.webButton("Cancel").press
									
									
end with							


executionController.stopTestCase_w_TestCaseNumber "ScheduledReports_SelectAnyReportToDelete_ValidateUI", "SCR_NEW_RDR_TC_001"

