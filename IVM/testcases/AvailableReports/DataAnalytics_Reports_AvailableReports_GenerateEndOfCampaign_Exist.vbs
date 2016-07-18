'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateEndOfCampaign_Exist
' Description					:	DataAnalytics_Reports_AvailableReports_GenerateEndOfCampaign_Exist
' Author 						:   Fonantrix Solution
' Date 							:   20-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateEndOfCampaign_Exist", "REP_EOC_TC_001"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS

With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
					
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportEndOfCampaign,1
						.webTable("AvailableReports").assertValue Desc_EOC,2
						.webTable("AvailableReports").asserttblLink reportEndOfCampaign,3

End with							

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateEndOfCampaign_Exist", "REP_EOC_TC_001"