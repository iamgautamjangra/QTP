'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateUIControls
' Description					:   Validate UI controls of "Channel 5 Data" Tab..
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateUIControls", "REP_VOD_TC_041"
   
START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
REM strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
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
                        wait 5
						.selectDate reportVODAdDeliveryDataFeed,"EndDate",END_DATE		
						wait 5
						
						.webList("SelectaProveder").assertExist "True"
					    .webList("SelectaProveder").selectItem strProvider
						 wait 5
                     							
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 5
						
						REM .selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						REM wait 5
						
											
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
													
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8

End with
				
with ivm.page(reportgen_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("VODAdDeliveryDataFeedReport").assertExist "True"
							.webElement("VODAdDeliveryDataFeedReport").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"

							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							 wait 5
							 
							.webLink("Channel5").assertExist "True"
							.webLink("Channel5").assertStatus "Visible"
							 wait 5

							 .webTable("Channel_5").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("Channel_5").assertExist "True"
							.webTable("Channel_5").assertStatus "Visible"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Time Range", "True"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Element ID", "True"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Site ID", "True"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Page ID", "True"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Advart Placement", "True"
							
							.webTable("Channel5Header_VOD").assertColumnExist "Total Ad View", "True"
							
							.webLink("BackToPreviousPage").press
							wait 10
							

End with

with ivm.page(report_page)
					
					        .webButton("Cancel").press
					        wait 5	

End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel5Data_ValidateUIControls", "REP_VOD_TC_041"