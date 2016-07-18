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
strUser=testcaseData.getValue("strUser")
strUserAction=testcaseData.getValue("strUserAction")
strItemtype=testcaseData.getValue("strItemtype")

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

with ivm.page(ScheduledReports_Page)
			
									
									.webTable("ScheduledReports").selectRow ReportName &";"& SearchVal &";"&"Delete"
									wait 3
									.webElement("DeleteScheduledReport").assertExist "True"
									.webElement("DeleteScheduledReport").assertStatus "Visible"
									
									.webButton("Delete").press
									
									.webElement("DeleteScheduledReport").assertExist "False"
									.webTable("ScheduledReports").assertDelValue ReportName
																		
									
end with							

ivm.NavigateToMenu MENU_AUDIT_LOG

wait 10

With ivm.page(AuditLog_page)

								.webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

End With								
executionController.stopTestCase_w_TestCaseNumber "ScheduledReports_SelectAnyReportToDelete_Confirm", "SCR_NEW_RDR_TC_001"

