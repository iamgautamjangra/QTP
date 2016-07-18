--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateFilterBySearch.
' Description					:   Validate the search functionality for the "Channel 5 Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateFilterBySearch.", "REP_VOD_TC_043"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
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
							
					    .selectDate reportVODAdDeliveryDataFeed,"StartDate",START_DATE

						.selectDate reportVODAdDeliveryDataFeed,"EndDate",END_DATE
						
						.webList("SelectaProveder").assertExist "True"
					    .webList("SelectaProveder").selectItem strProvider
						 wait 5
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProvider,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						
							
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("Channel5").press
							wait 4
							.webTable("Channel_5").assertExist "True"
							
							.webEdit("Search").assertExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("Channel_5").assertExist "True"													
					        .webTable("Channel_5").assertValue NO_RECORD_FOUND,1
							wait 5
							
							.webTable("SearchCriteria_VOD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_VOD").assertExist "True"
							.webLink("Search_VOD").assertStatus "Visible"
							
							.webLink("ClearAll_VOD").assertExist "True"
							.webLink("ClearAll_VOD").assertStatus "Visible"
							
							.webLink("Search_VOD").press							
							 wait 5
							
							.webLink("Search_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("Channel_5").assertExist "True"													
					        .webTable("Channel_5").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_VOD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_VOD").assertExist "True"
							.webLink("Search_VOD").assertStatus "Visible"
							
							.webLink("ClearAll_VOD").assertExist "True"
							.webLink("ClearAll_VOD").assertStatus "Visible"
							
							.webLink("Search_VOD").press							
							 wait 5
							
							.webLink("Search_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait 5
							.webImage("Search").press
							wait 5
							
							.webTable("Channel_5").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_VOD")assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("Search_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait 5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateFilterBySearch.", "REP_VOD_TC_043"
