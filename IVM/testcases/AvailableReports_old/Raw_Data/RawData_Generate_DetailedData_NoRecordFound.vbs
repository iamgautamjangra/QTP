'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_NoRecordFound
' Description					:	Validate the messge No record found for detailed data 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_NoRecordFound", "REP_RDR_TC_048"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait 10
					    .selectDate reportRawData,"StartDate",START_DATE

						.selectDate reportRawData,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3	
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5							
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
												
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RD").assertExist "True"
							.webTable("DetailedData_RD").assertValue NO_RECORD_FOUND,1
							wait 5
						
							.webLink("BackToPreviousPage").press
							wait 10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_NoRecordFound", "REP_RDR_TC_048"