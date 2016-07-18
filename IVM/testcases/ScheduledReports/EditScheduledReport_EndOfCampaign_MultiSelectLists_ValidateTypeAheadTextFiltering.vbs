'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_EOC_TC_007"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testcasedata.getvalue("SearchVal")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")

With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							       wait 10
																
								.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.selectListItem MULTI_LIST_SITES,"All","True"
									 wait 2
									.selectListItem MULTI_LIST_SITES,"All","False"
									 wait 2
									.webEdit("Sites").assertValue "Type to search..."
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait 2	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									 wait 3
									 strSites1=testcasedata.getvalue("strSites1")
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									 wait 3
									 
									
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									 wait 3
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									 wait 3
									.webEdit("Provider").assertValue "Type to search..."
									.webEdit("Provider").setValue strProvider
									 wait 3
									.assertListSearch MULTI_LIST_PROVIDER,strProvider
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"True"
									 wait 3
									 strProvider1=testcasedata.getvalue("strProvider1")
									.webEdit("Provider").assertValue strProvider1
									.selectListItem MULTI_LIST_PROVIDER,strProvider1,"False"
									 wait 3
																	 
									.webButton("Cancel").press
end with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_EOC_TC_007"
