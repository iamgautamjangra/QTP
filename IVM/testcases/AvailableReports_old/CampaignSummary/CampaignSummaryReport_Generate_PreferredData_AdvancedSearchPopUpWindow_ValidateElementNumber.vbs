'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber
' Description					:	Validate the element number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_CSR_TC_018"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
ElementNumber=testcasedata.getvalue("ElementNumber")
ElementNumberInv=testcasedata.getvalue("ElementNumberInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

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
						
						.webList("Grouping").selectItem strGrouping
						wait 3
						
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
						
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ElementNumber").setValue ElementNumber
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ElementNumber_CS").assertExist "True"
							
							.webTable("PreferredData_CS").assertExist "True"
							
							strElement= ElementNumber
							.webTable("PreferredData_CS").searchdata strElement
							wait 5	
'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ElementNumber").setValue ElementNumberInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ElementNumber_CS").assertExist "True"
							
							.webTable("PreferredData_CS").assertExist "True"
						
							.webTable("PreferredData_CS").assertvalue "No data exists for the selected criteria."
							wait 5
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
						.webButton("Cancel").press
						wait 5
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_CSR_TC_018"