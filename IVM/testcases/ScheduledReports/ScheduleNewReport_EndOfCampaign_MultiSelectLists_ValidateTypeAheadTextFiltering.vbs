'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_NEW_EOC_TC_007"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
REM strCampaign=testcasedata.getvalue("strCampaign")
REM strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
							       .webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.webEdit("Sites").assertValue "Type to search..."
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait Wait5	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									 wait Wait5
								
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									 wait 3
									
									 
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									.webEdit("Provider").assertValue "Type to search..."
									.webEdit("Provider").setValue strProvider
									 wait Wait5
									.assertListSearch MULTI_LIST_PROVIDER,strProvider
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"True"
									 wait Wait5
									 strProvider1=testcasedata.getvalue("strProvider1")
									.webEdit("Provider").assertValue strProvider1
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"False"
									 wait Wait5
									
									
									
													 
									.webButton("Cancel").press
				
end with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_NEW_EOC_TC_007"
