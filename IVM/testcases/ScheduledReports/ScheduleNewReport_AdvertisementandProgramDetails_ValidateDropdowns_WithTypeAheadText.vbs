'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_ASR_TC_007"

 ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait15

strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportAdvertisementandProgramDetails
									 wait Wait8
									 .selectDate "FirstDate", FIRST_DATE
									
									wait Wait3
											
									.selectDate "LastDate", LAST_DATE
									 wait Wait3
																
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.webEdit("Sites").assertValue "Type to search..."
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait Wait5	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									 wait Wait5
									 strSites1=testcasedata.getvalue("strSites1")
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									 wait Wait3
									
									 
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									.webEdit("Provider").assertValue "Type to search..."
									.webEdit("Provider").setValue strProvider
									
									.assertListSearch MULTI_LIST_PROVIDER,strProvider
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"True"
									
									 strProvider1=testcasedata.getvalue("strProvider1")
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
									 wait Wait2
									
									 
									 
									.webButton("Cancel").press
				
end with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_ASR_TC_007"
