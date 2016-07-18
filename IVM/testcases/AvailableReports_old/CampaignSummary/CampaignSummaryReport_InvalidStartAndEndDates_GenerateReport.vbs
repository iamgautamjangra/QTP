'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the creation of "Campaign Summary" report with Blank or invalid Start and End date.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_003"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 3

strStartDate=testcasedata.getvalue("strStartDate")
strEndDate=testcasedata.getvalue("strEndDate")
ErrorStartDate=testcasedata.getvalue("ErrorStartDate")
ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
						
		                .selectDate reportCampaignSummary,"StartDate",strStartDate
			             wait 5
						.selectDate reportCampaignSummary,"EndDate",strEndDate								    
						 wait 5
																					
					    .webButton("Generate").press
						 wait 5
								
						.assertExistWE ErrorStartDate,"True"
						 wait 2
						.assertExistWE ErrorEndDate,"True"
						 wait 2

						.webButton("Cancel").press
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_003"	