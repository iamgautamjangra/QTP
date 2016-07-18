'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search term filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   04-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_UCR_TC_026"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
SearchTermInvalid=testcasedata.getvalue("SearchTermInvalid")
SearchTermValid=testcasedata.getvalue("SearchTermValid")
SearchTermBlank=testcasedata.getvalue("SearchTermBlank")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
						 wait 10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						REM .webLink("FilterOptions").press
						REM wait 5
							
					    .selectDate reportUniqueCustomers,"StartDate",START_DATE

						.selectDate reportUniqueCustomers,"EndDate",END_DATE
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						REM .webList("Grouping").selectItem strGrouping
						REM wait 3
							
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							.webTable("DetailedData_UC").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue SearchTermInvalid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_UC").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_UC").assertExist "True"
							.webLink("SearchTerm_UC").assertStatus "Visible"
							
							.webLink("ClearAll_UC").assertExist "True"
							.webLink("ClearAll_UC").assertStatus "Visible"
							
							.webLink("SearchTerm_UC").press							
							 wait 5
							
							.webLink("SearchTerm_UC").assertExist "False"
							.webLink("ClearAll_UC").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait 3
							.webEdit("SearchTerm").setValue SearchTermValid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_UC")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_UC").assertExist "True"
							.webLink("SearchTerm_UC").assertStatus "Visible"
							
							.webLink("ClearAll_UC").assertExist "True"
							.webLink("ClearAll_UC").assertStatus "Visible"
							
							.webLink("SearchTerm_UC").press							
							 wait 5
							
							.webLink("SearchTerm_UC").assertExist "False"
							.webLink("ClearAll_UC").assertExist "False"

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").setValue SearchTermBlank
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_UC")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_UC").assertExist "False"
							.webLink("ClearAll_UC").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_UCR_TC_026"
