'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_PSR_TC_007"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
									  wait Wait15
																
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.selectListItem MULTI_LIST_SITES,"All","True"
									 wait Wait5
									.selectListItem MULTI_LIST_SITES,"All","False"
									 wait Wait5
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
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									 wait Wait5
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									 wait Wait5
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
								
									  	.selectDate "FirstDate", FIRST_DATE
							       wait Wait3									
							        .selectDate "LastDate", LAST_DATE
							         wait Wait3
									
									.webEdit("Campaign").assertExist "True"
									.webEdit("Campaign").assertStatus "Visible"
									.selectListItem MULTI_LIST_CAMPAIGN,"All","True"
									 wait Wait5
									.selectListItem MULTI_LIST_CAMPAIGN,"All","False"
									 wait Wait5
									.webEdit("Campaign").assertValue "Type to search..."
									.webEdit("Campaign").setValue strCampaign
									 wait Wait5
									.assertListSearch MULTI_LIST_CAMPAIGN,strCampaign
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
									 wait Wait5
									 strCampaign1=testcasedata.getvalue("strCampaign1")
									.webEdit("Campaign").assertValue strCampaign1
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"False"
									 wait Wait5
									
									 
									.webButton("Cancel").press
				
end with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_PSR_TC_007"
