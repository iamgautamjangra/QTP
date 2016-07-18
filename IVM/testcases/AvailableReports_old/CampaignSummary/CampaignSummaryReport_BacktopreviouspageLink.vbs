'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_BacktopreviouspageLink
' Description					:	Validate the "<Back To Previous Page" link on the Report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_BacktopreviouspageLink", "REP_CSR_TC_011"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
					
						.selectDate reportCampaignSummary,"StartDate",START_DATE
                        wait 5
						.selectDate reportCampaignSummary,"EndDate",END_DATE		
						wait 5
                     							
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 5
						
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5
						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
						.webList("Grouping").selectItem  strGrouping
						wait 5
						
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait 5	
End With

With ivm.page(report_page)
							
						.webElement("GeneralReportInformation").assertExist "True"							
						.webElement("GeneralReportInformation").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").press
						wait 5
							
						.webTable("AvailableReports").assertExist "True"
						.webTable("AvailableReports").assertStatus "Visible"
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_BacktopreviouspageLink", "REP_CSR_TC_011"