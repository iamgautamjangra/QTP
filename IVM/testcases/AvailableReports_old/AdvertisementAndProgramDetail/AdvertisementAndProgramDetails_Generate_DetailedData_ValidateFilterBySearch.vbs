'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_APD_TC_025"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
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

						.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
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
							
					    .selectDate reportAdvertisementAndProgramDetails,"StartDate",START_DATE

						.selectDate reportAdvertisementAndProgramDetails,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
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
							.webTable("DetailedData_APD").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_APD").assertExist "True"													
					        .webTable("DetailedData_APD").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_APD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_APD").assertExist "True"
							.webLink("Search_APD").assertStatus "Visible"
							
							.webLink("ClearAll_APD").assertExist "True"
							.webLink("ClearAll_APD").assertStatus "Visible"
							
							.webLink("Search_APD").press							
							 wait 5
							
							.webLink("Search_APD").assertExist "False"
							.webLink("ClearAll_APD").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_APD").assertExist "True"													
					        .webTable("DetailedData_APD").assertTableData 'TBD SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_APD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_APD").assertExist "True"
							.webLink("Search_APD").assertStatus "Visible"
							
							.webLink("ClearAll_APD").assertExist "True"
							.webLink("ClearAll_APD").assertStatus "Visible"
							
							.webLink("Search_APD").press							
							 wait 5
							
							.webLink("Search_APD").assertExist "False"
							.webLink("ClearAll_APD").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("DetailedData_APD").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_APD")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search_APD").assertExist "False"
							.webLink("ClearAll_APD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_APD_TC_025"
