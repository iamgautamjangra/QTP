'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateUIControls
' Description					:	Validate UI controls of "Channel 4 Data" Tab.
' Author 						:   Fonantrix Solution
' Date 							:   10-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateUIControls", "REP_VOD_TC_012"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait 10	
					
						.selectDate reportVODAdDeliveryDataFeed,"StartDate",START_DATE
                        wait 5
						.selectDate reportVODAdDeliveryDataFeed,"EndDate",END_DATE		
						wait 5
                     							
						.webCheckbox("Channel4").setstate "Checked"
						wait 3
						
						.webCheckbox("Channel5").setstate "Checked"
						wait 3
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3
						
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 3
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						
						.webCheckbox("Sky").setstate "Checked"
						wait 3	
						
						.webEdit("Comments").setValue strComments
						wait 3
						
						.webButton("Generate").press
						wait 5
End with 
wait 5
With ism.page(reportgen_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.weblink("Channel4Data").press
							 wait 5
							
                            .webTable("Channel4Data_VOD").assertExist "True"
                            .webTable("Channel4Data_VOD").assertStatus "Visible"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Date","True"						
					
							.webTable("Channel4Data_VOD").assertColumnExist "Provider","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Content Reference","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Region","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Campaign Reference","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Campaign Name","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Position","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Impressions","True"
							
							.webTable("Channel4Data_VOD").assertColumnExist "Actions","True"
							
							.webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
					       .webButton("Cancel").press
					        wait 5	
End with		

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_Channel4Data_ValidateUIControls", "REP_VOD_TC_012"