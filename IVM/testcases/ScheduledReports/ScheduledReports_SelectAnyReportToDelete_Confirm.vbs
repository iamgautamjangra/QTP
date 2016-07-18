'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduledReports_SelectAnyReportToDelete_Confirm
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduledReports_SelectAnyReportToDelete_Confirm", "SCR_NEW_RDR_TC_001"

SearchVal=testcaseData.getValue("SearchVal")
ReportName=testcaseData.getValue("ReportName")

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

with ivm.page(ScheduledReports_Page)
			
				
									.webTable("ScheduledReports").selectRow ReportName &";"& SearchVal &";"&"Delete"
									wait 3
									.webElement("DeleteScheduledReport").assertExist "True"
									.webElement("DeleteScheduledReport").assertStatus "Visible"
									
									.webButton("Delete").press
									
									.webElement("DeleteScheduledReport").assertExist "False"
									wait 5
									.webTable("ScheduledReports").assertDelValue ReportName
																		
									
end with							


executionController.stopTestCase_w_TestCaseNumber "ScheduledReports_SelectAnyReportToDelete_Confirm", "SCR_NEW_RDR_TC_001"

