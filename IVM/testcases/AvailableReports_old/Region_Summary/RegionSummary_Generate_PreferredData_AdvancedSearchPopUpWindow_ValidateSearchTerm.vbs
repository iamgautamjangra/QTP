'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search term filter using advanced search..
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RSR_TC_030"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
REM strGrouping=testcasedata.getvalue("strGrouping")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
						wait 5
							
					    .selectDate reportRegionSummary,"StartDate",START_DATE

						.selectDate reportRegionSummary,"EndDate",END_DATE
						
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

							.weblink("PreferredData").press
							wait 4
							.webTable("PreferredData").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait 5
												
							
							.webTable("SearchCriteria_RS").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").assertValue NO_RECORD_FOUND
							wait 5
							
							.weLink("SearchTerm_RS").assertExist "True"
							.weLink("SearchTerm_RS").assertStatus "Visible
							
							.webLink("SearchTerm_RS").press							
							 wait 5
														
							.webLink("SearchTerm_RS").assertExist "False"
							.webLink("ClearAll_RS").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait 3
							.webEdit("SearchTerm").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_RS")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_RS").assertExist "True"
							.webLink("SearchTerm_RS").assertStatus "Visible"
							
							.webLink("ClearAll_RS").assertExist "True"
							.webLink("ClearAll_RS").assertStatus "Visible"
							
							.webLink("SearchTerm_RS").press							
							 wait 5
							
							.webLink("SearchTerm_RS").assertExist "False"
							.webLink("ClearAll_RS").assertExist "False"

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("PreferredData").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_RS")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_RS").assertExist "False"
							.webLink("ClearAll_RS").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RSR_TC_30"
