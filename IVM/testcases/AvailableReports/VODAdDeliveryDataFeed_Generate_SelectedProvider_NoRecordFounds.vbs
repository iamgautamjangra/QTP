' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFounds 
' Description					:   Validate the table when no record is found matching the filter criteria.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFounds ", "REP_VOD_TC_035"

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
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						
							
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
End with 


With ivm.page(reportgen_page)


							.weblink("Channel4").press
							.webTable("Channel_4").assertValue NO_RECORD_FOUND,1
						    .webLink("BackToPreviousPage").press
							wait 10		
							
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFounds", "REP_VOD_TC_035"
