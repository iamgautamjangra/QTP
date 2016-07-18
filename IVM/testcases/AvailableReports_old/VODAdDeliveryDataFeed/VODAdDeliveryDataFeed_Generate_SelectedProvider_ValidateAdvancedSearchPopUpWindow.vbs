' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow
' Description					:   Validate the Advanced Search Popup Window controls.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_026"


strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")


REM ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
REM wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait 10
						 
														 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
						wait 5
							
						 .webElement("FilterOptions").assertExist "True"
						 .webElement("FilterOptions").assertStatus "Visible"
						
							
					   .selectListItem MULTI_LIST_TimeRange,strTimeRange,"True"
						wait 2
						.selectListItem MULTI_LIST_TimeRange,strTimeRange1,"True"
						wait 2
						
						.webList("SelectaProveder").assertExist "True"
					    .webList("SelectaProveder").selectItem strProvider
						 wait 5
						
						'.selectListItem MULTI_LIST_SITES,strSites,"True"
						'wait 3												
						'.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						'wait 3
						
							
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 

With ivm.page(PreferredData_page)

							.webLink("SelectedProvider").assertExist "True"
							.webLink("SelectedProvider").assertStatus "Visible"
							 .webLink("SelectedProvider").assertText strProvider
							  .webLink("SelectedProvider").press
							  wait 9
							  
							.webLink("AdvancedSearch").press
							wait 7
							
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
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							wait 8
							
                            .webLink("BackToPreviousPage").assertExist "True"
						    .webLink("BackToPreviousPage").assertStatus "Visible"							
						    .weblink("BackToPreviousPage").press
						    wait 10
					
End with
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
					
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateAdvancedSearchPopUpWindow", "REP_VOD_TC_026"
