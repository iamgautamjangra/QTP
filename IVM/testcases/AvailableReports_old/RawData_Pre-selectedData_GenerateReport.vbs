'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Pre-selectedData_GenerateReport
' Description					:	To validate the pre-populated values displayed when user generates a report without changing the filter criteria.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Pre-selectedData_GenerateReport", "REP_CSR_TC_012"


DataSet=testcasedata.getvalue("DataSet")
strProvider=testcasedata.getvalue("strProvider")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS

wait Wait10

with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait7

						.webTable("DataSet").presstblRadioBtn DataSet,1
						
						wait Wait5
																					
					    .webButton("Generate").press
						 wait Wait5
						
						
						
End with

With ivm.page(preferredData_page)

						.webElement("FilterOptions").assertExist "True"
						
						.webElement("FilterOptions").assertStatus "Visible"
						
						
						
End With
						
						
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Pre-selectedData_GenerateReport", "REP_CSR_TC_012"	