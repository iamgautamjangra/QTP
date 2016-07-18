'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange 
' Description					:	Validate the Time range filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_030"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
TimeRange_val=REPORT_START_DATE1
TimeRange_val1=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
TimeRange_Inv=testcasedata.getvalue("TimeRange_Inv")
TimeRange_Inv1=testcasedata.getvalue("TimeRange_Inv1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	

						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5 

						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").press
						wait 5
						
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
						wait 5
						.webEdit("Comments").setValue strComments
						wait 5						
						.webButton("Generate").press
						wait 5 

End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							 wait 5
							 
							.webTable("PreferredData_CS").assertExist "True"
							
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
							 
							.webTable("PreferredData_CS").assertTableData 'TBD strFromTo
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
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_030"