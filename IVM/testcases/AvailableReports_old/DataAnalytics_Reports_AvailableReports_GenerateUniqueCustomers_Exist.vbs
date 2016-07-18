'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_Reports_AvailableReports_GenerateUniqueCustomers_Exist
' Description					:	Validate  "UniqueCustomers" should be displayed in the Report page.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateUniqueCustomers_Exist", "REP_UCR_TC_001"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait20
With ivm.page(report_page)

						.webElement("AvailableReports").assertExist "True"
						.webElement("AvailableReports").assertStatus "Visible"

						.webTable("AvailableReports").assertExist "True"
						
						.webTable("ReportColumn").assertColumnExist "Report Name","True"
						.webTable("ReportColumn").assertColumnExist "Description","True"
						.webTable("ReportColumn").assertColumnExist "Actions","True"

						.webTable("AvailableReports").assertValue reportUniqueCustomers,1
						.webTable("AvailableReports").assertValue Desc_UC,2
						.webTable("AvailableReports").asserttblLink reportUniqueCustomers,3

End with							

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_Reports_AvailableReports_GenerateUniqueCustomers_Exist", "REP_UCR_TC_001"