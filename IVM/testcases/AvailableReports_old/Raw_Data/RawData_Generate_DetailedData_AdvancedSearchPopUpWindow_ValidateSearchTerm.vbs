'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RDR_TC_040"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

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
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							.webTable("DetailedData_RD").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_RD").assertExist "True"
							.webLink("SearchTerm_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("SearchTerm_RD").press							
							 wait 5
							
							.webLink("SearchTerm_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait 3
							.webEdit("SearchTerm").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_RD").assertExist "True"
							.webLink("SearchTerm_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("SearchTerm_RD").press							
							 wait 5
							
							.webLink("SearchTerm_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RDR_TC_040"
