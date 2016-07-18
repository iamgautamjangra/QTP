'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Pre-selectedData_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Pre-selectedData_GenerateReport", "REP_CSR_TC_013"


DataSet=testcasedata.getvalue("DataSet")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Pre-selectedData_GenerateReport", "REP_CSR_TC_013"	