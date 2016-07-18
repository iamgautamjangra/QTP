'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_RawData_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_RDR_TC_007"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strSitesAll=testcasedata.getvalue("strSitesAll")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")
strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignAll=testcasedata.getvalue("strCampaignAll")

With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options","6"
							        wait Wait15
									
									.selectDate "FirstDate", FIRST_DATE
									wait Wait3									
									.selectDate "LastDate", LAST_DATE
									 wait Wait3
																
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
									 wait Wait2
									.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
									 wait Wait2
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait Wait5	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									 wait Wait5
									 strSites1=testcasedata.getvalue("strSites1")
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									 wait Wait2
									
									
									
									.webEdit("Provider").assertExist "True"
									.webEdit("Provider").assertStatus "Visible"
									.selectListItem MULTI_LIST_PROVIDER,strProviderIdAll,"True"
									 wait Wait2
									.selectListItem MULTI_LIST_PROVIDER,strProviderIdAll,"False"
									 wait Wait2
									.webEdit("Provider").setValue strProviderId
									.assertListSearch MULTI_LIST_PROVIDER,strProviderId
									.selectListItem MULTI_LIST_PROVIDER,strProviderId1,"True"
									wait Wait2
									 strProviderId1=testcasedata.getvalue("strProviderId1")
									.webEdit("Provider").assertValue strProviderId1
									.selectListItem MULTI_LIST_PROVIDER,strProviderId1,"False"
                                    wait Wait2 
									
									.webEdit("Campaign").assertExist "True"
									.webEdit("Campaign").assertStatus "Visible"
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
									 wait Wait2
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False"
									 wait Wait2
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
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_EDIT_RDR_TC_007"
