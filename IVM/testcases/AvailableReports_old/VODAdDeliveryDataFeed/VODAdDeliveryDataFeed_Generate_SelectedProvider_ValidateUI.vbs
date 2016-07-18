'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateUIControls
' Description					:   Validate UI controls of "Selected Provider" Tab.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateUIControls", "REP_VOD_TC_022"

strTimeRange=testcasedata.getvalue("strTimeRange")
strSeachValue=testcasedata.getvalue("strSeachValue")
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
                     							
									
											
						'.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						'wait 5
						
													
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8

End with
				
with ivm.page(PreferredData_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("VODAdDeliveryDataFeedReport").assertExist "True"
							.webElement("VODAdDeliveryDataFeedReport").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"

							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							 wait 5
							 
							.webLink("SelectedProvider").assertExist "True"
							.webLink("SelectedProvider").assertStatus "Visible"
							 .webLink("SelectedProvider").assertText strProvider
							  .webLink("SelectedProvider").press
							  wait 9

													
							.webEdit("Search").assertExist "True"
							.webEdit("Search").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("ProviderHeader").assertExist "True"
														
							.webTable("ProviderHeader").assertColumnExist "Date", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Provider", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Content Reference", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Region", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Campaign Reference", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Campaign Name", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Position", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Impressions", "True"
							
							.webTable("ProviderHeader").assertColumnExist "Actions", "True"
							
							.webLink("BackToPreviousPage").press
							wait 10
							

End with

with ivm.page(report_page)
					
					        .webButton("Cancel").press
					        wait 5	

End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateUIControls", "REP_VOD_TC_022"