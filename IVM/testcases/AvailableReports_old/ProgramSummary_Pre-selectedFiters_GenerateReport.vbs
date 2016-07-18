'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Pre-selectedFiters_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Pre-selectedFiters_GenerateReport", "REP_CSR_TC_013"


DataSet=testcasedata.getvalue("DataSet")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						
						.webButton("Generate").press
						wait Wait8

End with
With ivm.page(preferredData_page)

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							
						
End With
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Pre-selectedFiters_GenerateReport", "REP_CSR_TC_013"	