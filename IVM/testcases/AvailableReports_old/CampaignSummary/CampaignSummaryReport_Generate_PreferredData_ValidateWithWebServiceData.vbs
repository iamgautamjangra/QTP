'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_ValidateWithWebServiceData
' Description					:	Validate the data with webservices for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_ValidateWithWebServiceData", "REP_CSR_TC_028"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportCampaignSummary,3
					     wait 5
					     
					     .selectDate reportCampaignSummary,"StartDate",strStart

						.selectDate reportCampaignSummary,"EndDate",strEnd
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						.webList("Grouping").selectItem strGrouping
						wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(reportgen_page)	

						.webLink("PreferredData").press
						wait 5
						
					
					''''''validate data with DGW
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_ValidateWithWebServiceData", "REP_CSR_TC_028"