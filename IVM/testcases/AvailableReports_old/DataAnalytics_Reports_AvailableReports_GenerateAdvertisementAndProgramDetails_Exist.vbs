'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist
' Description					:	Validate  "Advertisement And Program Details" should be displayed in the Report page.
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist", "REP_APD_TC_001"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportAdvertisementandProgramDetails,1
						.webTable("AvailableReports").assertValue Desc_APD,2
						.webTable("AvailableReports").asserttblLink reportAdvertisementandProgramDetails,3

End with								

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateAdvertisementAndProgramDetails_Exist", "REP_APD_TC_001"