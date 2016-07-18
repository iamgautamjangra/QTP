' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateClearAll 
' Description					:   Validate "Clear All" functionality in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateClearAll ", "REP_VOD_TC_053"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strElementID=testcasedata.getvalue("strElementID")
strSiteID=testcasedata.getvalue("strSiteID")
strPageID=testcasedata.getvalue("strPageID")


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
						    .webTable("Channel_5").assertStatus "Visible"
							
							.webLink("AdvancedSearch").press
							wait 3												
														
																											
							.webEdit("ElementID").setValue strElementID
							wait 3
							
							.webEdit("SiteID").setValue strSiteID
							wait 3
							
							.webEdit("PageID").setValue strPageID
							wait 3
							
							
							.selectDate reportCampaignSummary,"StartDate",START_DATE

							.selectDate reportCampaignSummary,"EndDate",END_DATE
							wait 3
							
						
						    .webLink("ClearAll_VOD").press
							
							.webEdit("ElementID").assertValue ""
							wait 3
							
							.webEdit("SiteID").assertValue ""
							wait 3
							
							.webEdit("PageID").assertValue ""
							wait 3
							
							.webEdit("Between").assertValue "yyyy-mm-dd"
							.webEdit("And").assertValue "yyyy-mm-dd"
							
							 .webLink("AdvCancel").press
						    wait 5
						     .webLink("BackToPreviousPage").press
						     wait 10
							
							
End With							
					        			
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_VOD_TC_053"
