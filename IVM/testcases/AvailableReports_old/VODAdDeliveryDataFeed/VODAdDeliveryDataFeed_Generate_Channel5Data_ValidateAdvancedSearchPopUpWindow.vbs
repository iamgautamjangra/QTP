' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateAdvancedSearchPopUpWindow
' Description					:   Validate the Advanced Search Popup Window controls
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_045"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")


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
							.webLink("AdvancedSearch").press
							wait 3
							
							.webElement("SearchTerm").assertExist "True"
							.webElement("SearchTerm").assertStatus "Visible"
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webElement("ElementID").assertExist "True"
							.webElement("ElementID").assertStatus "Visible"
							.webEdit("ElementID").assertExist "True"
							.webEdit("ElementID").assertStatus "Visible"
							
							
							.webElement("SiteID").assertExist "True"
							.webElement("SiteID").assertStatus "Visible"
							.webEdit("SiteID").assertExist "True"
							.webEdit("SiteID").assertStatus "Visible"
							
							.webElement("PageID").assertExist "True"
							.webElement("PageID").assertStatus "Visible"
							.webEdit("PageID").assertExist "True"
							.webEdit("PageID").assertStatus "Visible"
							
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
														
							.webElement("Between").assertExist "True"
							.webElement("Between").assertStatus "Visible"
							.webEdit("Between").assertExist "True"
							.webEdit("Between").assertStatus "Visible"
							.webImage("Between").assertExist "True"
							.webImage("Between").assertStatus "Visible"
							
							.webElement("And").assertExist "True"
							.webElement("And").assertStatus "Visible"
							.webEdit("And").assertExist "True"
							.webEdit("And").assertStatus "Visible"
							.webImage("And").assertExist "True"
							.webImage("And").assertStatus "Visible"
							
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
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_045"
