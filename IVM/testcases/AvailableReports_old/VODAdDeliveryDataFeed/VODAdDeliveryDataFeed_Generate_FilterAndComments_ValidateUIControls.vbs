'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate the UI controls of "Filter and Comments" Tab.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls", "REP_VOD_TC_021"

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
						
							
						
						
						.webList("SelectaProveder").assertExist "True"
					    .webList("SelectaProveder").selectItem strProvider
						 wait 5
                     							
						  .selectListItem MULTI_LIST_TimeRange,strTimeRange,"True"
						wait 2
						.selectListItem MULTI_LIST_TimeRange,strTimeRange1,"True"
						wait 2
											
						'.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						'wait 5
						
													
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8

End with

REM 'Market Details table exist					
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

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
							 wait 5

						                     
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"
		                     
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							
							
							
							TimeRange=strTimeRange & ", " & strTimeRange1
							
							.webElement("TimeRange_val").assertExist "True"
							.webElement("TimeRange_val").assertStatus "Visible"
							.webElement("TimeRange_val").assertText TimeRange
							
							
							.webElement("ShowProvider").assertExist "True"
							.webElement("ShowProvider").assertStatus "Visible"
							.webElement("ShowProvider").assertText "Show provider"
							
							.webElement("ProviderId_val").assertExist "True"
							.webElement("ProviderId_val").assertStatus "Visible"
							.webElement("ProviderId_val").assertText strProvider
							
							
							
							REM .webElement("CampaignValue").assertExist "True"
							REM .webElement("CampaignValue").assertStatus "Visible"
							REM .assertExistWE strCampaign,"True"
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							
							
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments
														
							 
					        .webLink("BackToPreviousPage").press
			                 wait 10
End with

with ivm.page(report_page)
					
					        .webButton("Cancel").press
					        wait 5	

End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls", "REP_VOD_TC_021"