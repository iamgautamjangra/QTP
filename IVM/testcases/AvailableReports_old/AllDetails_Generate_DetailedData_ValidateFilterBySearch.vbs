'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetails_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AllDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_ADR_TC_023"


strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
																 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
							wait Wait5 
						 
						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
						
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait2					
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange1,"True"							                  							
					    wait Wait2										
					  						
																	
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
												
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(DetailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_Header").assertExist "True"													
					        .webTable("DetailedData_Header").assertValue NO_RECORD_FOUND,1
							wait Wait5
							
							.webTable("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search").assertExist "True"
							.webLink("Search").assertStatus "Visible"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("Search").press							
							 wait Wait5
							
							.webLink("Search").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").searchData SearchTermValid
							wait Wait5
							
							.webTable("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search").assertExist "True"
							.webLink("Search").assertStatus "Visible"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("Search").press							
							 wait Wait5
							
							.webLink("Search").assertExist "False"
							.webLink("ClearAll").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        wait Wait5
							
							.webTable("SearchCriteria").assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AllDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_ADR_TC_023"
