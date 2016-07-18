' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow
' Description					:   Validate the Advanced Search Popup Window controls.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_026"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")


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
						
						.webList("SelectaProveder").asserExist "True"
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

							.weblink("Channel4").press
							wait 4
							.webLink("AdvancedSearch").press
							wait 3
							
							.webElement("SearchTerm").assertExist "True"
							.webElement("SearchTerm").assertStatus "Visible"
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webElement("ContentReference").assertExist "True"
							.webElement("ContentReference").assertStatus "Visible"
							.webEdit("ContentReference").assertExist "True"
							.webEdit("ContentReference").assertStatus "Visible"
							
							
							.webElement("CampaignReference").assertExist "True"
							.webElement("CampaignReference").assertStatus "Visible"
							.webEdit("CampaignReference").assertExist "True"
							.webEdit("CampaignReference").assertStatus "Visible"
							
							.webElement("CampaignName").assertExist "True"
							.webElement("CampaignName").assertStatus "Visible"
							.webEdit("CampaignName").assertExist "True"
							.webEdit("CampaignName").assertStatus "Visible"
							
							.webElement("Region").assertExist "True"
							.webElement("Region").assertStatus "Visible"
							.webEdit("Region").assertExist "True"
							.webEdit("Region").assertStatus "Visible"
							
														
						
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webButton("AdvCancel").assertExist "True"
							.webButton("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							wait 5
							
                            .webLink("BackToPreviousPage").assertExist "True"
						    .webLink("BackToPreviousPage").assertStatus "Visible"							
						    .weblink("BackToPreviousPage").press
						    wait 10
					
End with
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_026"
