'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateProgramSummary_Exist
' Description					:	Validate  "ProgramSummary" should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateProgramSummary_Exist", "REP_PSR_TC_001"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait15
With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportProgramSummary,1
						.webTable("AvailableReports").assertValue Desc_PS,2
						.webTable("AvailableReports").asserttblLink reportProgramSummary,3

End with								

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateProgramSummary_Exist", "REP_PSR_TC_001"