'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   SeaChange
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateFilterBySearch", "REP_RDR_TC_032"

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
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait Wait10
					    .selectDate reportRawData,"StartDate",START_DATE

						.selectDate reportRawData,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait Wait3	
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						     wait Wait5							
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
						
							
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_RD").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").assertValue NO_RECORD_FOUND,1
							wait Wait5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_RD").assertExist "True"
							.webLink("Search_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("Search_RD").press							
							 wait Wait5
							
							.webLink("Search_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").searchData SearchTermValid
							wait Wait5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_RD").assertExist "True"
							.webLink("Search_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("Search_RD").press							
							 wait Wait5
							
							.webLink("Search_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        wait Wait5
							
							.webTable("SearchCriteria_RD")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateFilterBySearch", "REP_RDR_TC_032"
