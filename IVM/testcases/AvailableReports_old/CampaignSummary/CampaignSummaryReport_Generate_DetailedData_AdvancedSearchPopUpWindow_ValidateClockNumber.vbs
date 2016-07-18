'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClockNumber
' Description					:	Validate the clock number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClockNumber", "REP_CSR_TC_036"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
ClockNumber=testcasedata.getvalue("ClockNumber")
ClockNumberInv=testcasedata.getvalue("ClockNumberInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportCampaignSummary,3
					    wait 10
					    
					    .selectDate reportCampaignSummary,"StartDate",START_DATE

						.selectDate reportCampaignSummary,"EndDate",END_DATE
						
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
						8
						
End with	

With ivm.page(reportgen_page)	

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ClockNumber").setValue ClockNumber
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ClockNumber_CS").assertExist "True"
							
							.webTable("DetailedData_CS").assertExist "True"
							
							strClock= ClockNumber
							.webTable("DetailedData_CS").searchdata strClock
							wait 5	
'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ClockNumber").setValue ClockNumberInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ClockNumber_CS").assertExist "True"
							
							.webTable("DetailedData_CS").assertExist "True"
						
							.webTable("DetailedData_CS").assertvalue "No data exists for the selected criteria."
							wait 5
					        .webLink("BackToPreviousPage").press
							wait 10
							
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							 wait 5
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClockNumber", "REP_CSR_TC_036"