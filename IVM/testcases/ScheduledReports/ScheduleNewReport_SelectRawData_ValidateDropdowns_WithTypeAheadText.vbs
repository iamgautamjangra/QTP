'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_SelectRawData_ValidateDropdowns_WithTypeAheadText
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_SelectRawData_ValidateDropdowns_WithTypeAheadText", "SCR_NEW_RDR_TC_007"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30


strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									  wait Wait15
									
									.webRadiogroup("ReportType").selectGroupItem reportRawdata
										
									.selectDate "FirstDate", FIRST_DATE
									wait Wait3									
									.selectDate "LastDate", LAST_DATE
									 wait Wait3
												
									.webRadiogroup("Site_SiteGroup").selectGroupItem "Sites"
									
									wait Wait2	
							       .webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.webEdit("Sites").assertValue "Type to search..."
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait Wait2	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									wait Wait2
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									wait Wait2
									
									 
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									.webEdit("Provider").assertValue "Type to search..."
									.webEdit("Provider").setValue strProvider
									.assertListSearch MULTI_LIST_PROVIDER,strProvider
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"True"
									wait Wait3
									.webEdit("Provider").assertValue strProvider1
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"False"
									wait Wait2							
									 
									
									.webEdit("Campaign").assertExist "True"
									.webEdit("Campaign").assertStatus "Visible"
									.webEdit("Campaign").assertValue "Type to search..."
									.webEdit("Campaign").setValue strCampaign
									.assertListSearch MULTI_LIST_CAMPAIGN,strCampaign
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
									wait Wait2
									 strCampaign1=testcasedata.getvalue("strCampaign1")
									.webEdit("Campaign").assertValue strCampaign1
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"False"
									 
																	 	 
									.webButton("Cancel").press
				
end with



'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_SelectRawData_ValidateDropdowns_WithTypeAheadText", "SCR_NEW_RDR_TC_007"
