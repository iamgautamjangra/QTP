'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Preferred Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_023"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

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
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("PreferredData").press
							wait 4
							.webTable("PreferredData_CS").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("PreferredData_CS").assertExist "True"													
					        .webTable("PreferredData_CS").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_CS").assertExist "True"
							.webLink("SearchTerm_CS").assertStatus "Visible"
							
							.webLink("ClearAll_CS").assertExist "True"
							.webLink("ClearAll_CS").assertStatus "Visible"
							
							.webLink("SearchTerm_CS").press							
							 wait 5
							
							.webLink("SearchTerm_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait 3
							.webEdit("SearchTerm").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("PreferredData_CS").assertExist "True"													
					        .webTable("PreferredData_CS").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_CS").assertExist "True"
							.webLink("SearchTerm_CS").assertStatus "Visible"
							
							.webLink("ClearAll_CS").assertExist "True"
							.webLink("ClearAll_CS").assertStatus "Visible"
							
							.webLink("SearchTerm_CS").press							
							 wait 5
							
							.webLink("SearchTerm_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("PreferredData_CS").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_023"
