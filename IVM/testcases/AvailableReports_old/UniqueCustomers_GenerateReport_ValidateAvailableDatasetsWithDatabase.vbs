'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_GenerateReport_ValidateAvailableDatasetsWithDatabase
' Description					:   Validate Default view Controls of "Advertisement And Program Details" report..			
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_GenerateReport_ValidateAvailableDatasetsWithDatabase", "REP_APD_TC_002"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
	wait Wait5
	 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
						wait Wait10



						.webTable("DataSet").assertTableData "DataSet",reportUniqueCustomers
						
End with
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_GenerateReport_ValidateAvailableDatasetsWithDatabase", "REP_APD_TC_002"