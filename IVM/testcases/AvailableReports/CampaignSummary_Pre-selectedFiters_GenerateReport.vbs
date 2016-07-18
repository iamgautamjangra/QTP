'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Pre-selectedFiters_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Pre-selectedFiters_GenerateReport", "REP_CSR_TC_013"


DataSet=testcasedata.getvalue("DataSet")

'strTimeRange=testcasedata.getvalue("strTimeRange")
'strCampaign=testcasedata.getvalue("strCampaign")
'strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait20
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
                         .webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait 2						 
						 
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