'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Pre-selectedData_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Pre-selectedData_GenerateReport", "REP_CSR_TC_013"


DataSet=testcasedata.getvalue("DataSet")

strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Pre-selectedData_GenerateReport", "REP_CSR_TC_013"	