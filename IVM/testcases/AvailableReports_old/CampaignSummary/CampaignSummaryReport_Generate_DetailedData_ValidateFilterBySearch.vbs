'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ValidateFilterBySearch", "REP_CSR_TC_032"

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

							.weblink("DetailedData").press
							wait 4
							.webTable("DetailedData_CS").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_CS").assertExist "True"													
					        .webTable("DetailedData_CS").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_CS").assertExist "True"
							.webLink("Search_CS").assertStatus "Visible"
							
							.webLink("ClearAll_CS").assertExist "True"
							.webLink("ClearAll_CS").assertStatus "Visible"
							
							.webLink("Search_CS").press							
							 wait 5
							
							.webLink("Search_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_CS").assertExist "True"													
					        .webTable("DetailedData_CS").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_CS").assertExist "True"
							.webLink("Search_CS").assertStatus "Visible"
							
							.webLink("ClearAll_CS").assertExist "True"
							.webLink("ClearAll_CS").assertStatus "Visible"
							
							.webLink("Search_CS").press							
							 wait 5
							
							.webLink("Search_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_CS").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_CS")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search_CS").assertExist "False"
							.webLink("ClearAll_CS").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ValidateFilterBySearch", "REP_CSR_TC_032"
