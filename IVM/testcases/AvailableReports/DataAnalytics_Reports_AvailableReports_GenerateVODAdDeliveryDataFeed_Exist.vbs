'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateVODAdDeliveryDataFeed_Exist
' Description					:	Validate "VOD Ad Delivery Data Feed" should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateVODAdDeliveryDataFeed_Exist", "REP_VOD_TC_001"

	ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
	wait Wait10
	With ivm.page(report_page)

							.webElement("AvailableReports").assertExist "True"
							.webElement("AvailableReports").assertStatus "Visible"

							.webTable("AvailableReports").assertExist "True"
							
							.webTable("ReportColumn").assertColumnExist "Report Name","True"
							.webTable("ReportColumn").assertColumnExist "Description","True"
							.webTable("ReportColumn").assertColumnExist "Actions","True"

							.webTable("AvailableReports").assertValue reportVODAdDeliveryDataFeed,1
							.webTable("AvailableReports").assertValue Desc_VOD,2
							.webTable("AvailableReports").asserttblLink reportVODAdDeliveryDataFeed,3

	End with							

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateVODAdDeliveryDataFeed_Exist", "REP_VOD_TC_001"