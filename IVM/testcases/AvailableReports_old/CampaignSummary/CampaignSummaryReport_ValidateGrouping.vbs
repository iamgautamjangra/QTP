'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_ValidateGrouping
' Description					:	Validate the Regions list box available on the "Campaign Summary" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateGrouping", "REP_CSR_TC_008"

strGrouping=testcasedata.getvalue("strGrouping")
strGrouping1=testcasedata.getvalue("strGrouping1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							wait 10
							
							.webList("Grouping").assertExist "True"
							.webList("Grouping").assertStatus "Visible"
							
							.assertListItems LIST_GROUPING,""
							
							.webList("Grouping").selectItem strGrouping
							 wait 3
							.webList("Grouping").validateSelectedItem strGrouping
							
							.webList("Grouping").selectItem strGrouping1
							 wait 3
							.webList("Grouping").validateSelectedItem strGrouping1	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateGrouping", "REP_CSR_TC_007"