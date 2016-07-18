'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateAdvertisementSummary_Exist
' Description					:	Validate  "AdvertisementSummary" should be displayed in the Report page.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementSummary_Exist", "REP_ASR_TC_001"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS

If Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").WebElement("weAvailableReports").Exist(10) then

	With ivm.page(report_page)
							.webElement("AvailableReports").assertExist "True"
							.webElement("AvailableReports").assertStatus "Visible"

							.webTable("AvailableReports").assertExist "True"
							
							.webTable("ReportColumn").assertColumnExist "Report Name","True"
							.webTable("ReportColumn").assertColumnExist "Description","True"
							.webTable("ReportColumn").assertColumnExist "Actions","True"

							.webTable("AvailableReports").assertValue reportAdvertisementSummary,1
							.webTable("AvailableReports").assertValue Desc_AS,2
							.webTable("AvailableReports").asserttblLink reportAdvertisementSummary,3

	End with								
End if
'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementSummary_Exist", "REP_ASR_TC_001"