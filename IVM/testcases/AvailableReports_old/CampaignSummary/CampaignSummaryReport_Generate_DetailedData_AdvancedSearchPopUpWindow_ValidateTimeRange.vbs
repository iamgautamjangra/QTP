'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange 
' Description					:	Validate the date range filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_038"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
TimeRange_Inv=testcasedata.getvalue("TimeRange_Inv")
TimeRange_Inv1=testcasedata.getvalue("TimeRange_Inv1")

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
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							
							.webLink("AdvancedSearch").press
							wait 5	
							
							.selectDate reportCampaignSummary,"StartDate",TimeRange_val	
							wait 5
							.selectDate reportCampaignSummary,"EndDate",TimeRange_val1
							wait 5
							.webLink("AdvSearch").press
							 wait 5		
							 
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webLink("TimeRange_CS").assertExist "True"
							.webLink("TimeRange_CS").assertStatus "Visible"
							 
							 strFromTo= "From " & TimeRange_val & " to " & TimeRange_val1	
							 
							.webTable("DetailedData_CS").searchData strFromTo
							wait 5
							
' For invalid							
							.webLink("AdvancedSearch").press					
							 wait 5	
							 
							.selectDate reportCampaignSummary,"StartDate",TimeRange_Inv	
							wait 5							
							.selectDate reportCampaignSummary,"EndDate",TimeRange_Inv1	
							wait 5
							.webLink("AdvSearch").press					
							 wait 5		
							 
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
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
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_038"