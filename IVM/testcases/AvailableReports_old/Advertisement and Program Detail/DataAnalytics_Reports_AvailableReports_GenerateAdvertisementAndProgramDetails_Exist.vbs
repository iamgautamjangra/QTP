'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist
' Description					:	Validate  "Advertisement And Program Details" should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist", "REP_APD_TC_001"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS

With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
						.webTable("AvailableReports").assertStatus "Visible"
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportAdvertisementAndProgramDetails,1
						.webTable("AvailableReports").asserttblLink reportAdvertisementAndProgramDetails,3

End with							

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist", "REP_APD_TC_001"