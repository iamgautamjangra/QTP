' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSearchTerm 
' Description					:   Validate Advanced Search functionality for "Channel 5 Data" page
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSearchTerm ", "REP_VOD_TC_049"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
SearchTermValid=testcasedata.getvalue("SearchTermValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")
SearchTermInValid=testcasedata.getvalue("SearchTermInValid")


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
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
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
							.webLink("AdvancedSearch").press
							wait 3
							
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("Channel_5").assertExist "True"													
					        .webTable("Channel_5").assertValue NO_RECORD_FOUND
							wait 5
							
							.webTable("SearchCriteria_VOD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
														
							.webLink("SearchTerm_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"
							
'Search with valid data							
							
							.webLink("AdvancedSearch").press
							wait 3
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait 5
													
							.webTable("Channel_5").assertExist "True"													
					        .webTable("Channel_5").searchData SearchTermValid
							wait 5
							
							.webTable("SearchCriteria_VOD")assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_VOD").assertExist "True"
							.webLink("SearchTerm_VOD").assertStatus "Visible"
							
							.webLink("ClearAll_VOD").assertExist "True"
							.webLink("ClearAll_VOD").assertStatus "Visible"
							
							.webLink("SearchTerm_VOD").press							
							 wait 5
							
							.webLink("SearchTerm_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait 3
							
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait 5
							
							.webTable("Channel_5").assertExist "True"													
					        wait 5
							
							.webTable("SearchCriteria_VOD").assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait 10
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_VOD_TC_049"
