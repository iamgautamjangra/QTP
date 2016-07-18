'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateReportCampaignSummaryReport_Exist
' Description					:	Validate  "Campaign Summary" report should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateReportCampaignSummaryReport_Exist", "REP_CSR_TC_001"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS

With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
						.webTable("AvailableReports").assertStatus "Visible"
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportCampaignSummary,1
						.webTable("AvailableReports").asserttblLink reportCampaignSummary,3

End with							

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateReportCampaignSummaryReport_Exist", "REP_CSR_TC_001"