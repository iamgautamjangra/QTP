'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch
' Description					:   Validate the serarch functionality on Preferred Data tab..
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch", "REP_ASR_TC_023"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
							
						 .webElement("FilterOptions").assertExist "True"
						 .webElement("FilterOptions").assertStatus "Visible"
						 REM .webElement("FilterOptions").press
						REM wait 5
							
					    .selectDate reportAdvertisementSummary,"StartDate",START_DATE

						.selectDate reportAdvertisementSummary,"EndDate",END_DATE
						
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
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_AS").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_AS").assertExist "True"
							.webLink("Search_AS").assertStatus "Visible"
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("Search_AS").press							
							 wait 5
							
							.webLink("Search_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_AS").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_AS").assertExist "True"
							.webLink("Search_AS").assertStatus "Visible"
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("Search_AS").press							
							 wait 5
							
							.webLink("Search_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("PreferredData").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_AS").assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch", "REP_ASR_TC_023"
