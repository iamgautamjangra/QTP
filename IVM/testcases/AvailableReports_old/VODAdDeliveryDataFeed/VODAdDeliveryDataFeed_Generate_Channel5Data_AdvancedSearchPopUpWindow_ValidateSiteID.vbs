'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSiteID
' Description					:	Validate "Site ID" text box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSiteID", "REP_VOD_TC_048"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
SiteID=testcasedata.getvalue("SiteID")
SiteIDInv=testcasedata.getvalue("SiteIDInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

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

							.webLink("Channel5").press
							wait 5
							
							.webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("SiteID").setValue SiteID
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_VOD").assertExist "True" 
							.webTable("SearchCriteria_VOD").assertStatus "Visible"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.weLink("SiteID_VOD").assertExist "True"
							.weLink("SiteID_VOD").assertStatus "Visible"
							
							.webLink("ClearAll_VOD").assertExist "True"
							.webLink("ClearAll_VOD").assertStatus "Visible"
							
							.webTable("Channel_5").assertExist "True"
							
							strSite= SiteID
							.webTable("Channel_5").searchdata strSite
							wait 5	
							
							.webLink("SiteID_VOD").press							
							 wait 5
							
							.webLink("SiteID_VOD").assertExist "False"
							.webLink("ClearAll_VOD").assertExist "False"
'For invalid

							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("SiteID").setValue SiteIDInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
												
							.webTable("SearchCriteria_VOD").assertExist "True" 
							.webTable("SearchCriteria_VOD").assertStatus "Visible"
							.WebElement("SearchCriteria").assertStatus "Visible"
							
							.weLink("SiteID_VOD").assertExist "True"
							
							.webTable("Channel_5").assertExist "True"
						
							.webTable("Channel_5").assertvalue "No data exists for the selected criteria."
							wait 5
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.WebElement("AvailableReports").assertExist "True"
						    .WebElement("AvailableReports").assertStatus "Visible"
						
End With				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_AdvancedSearchPopUpWindow_ValidateSiteID", "REP_VOD_TC_048"