'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   SeaChange
' Date 							:   10-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_NEW_APD_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testcasedata.getvalue("ReportName")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									 wait 8
																
									.webEdit("Sites").assertExist "True"
									.webEdit("Sites").assertStatus "Visible"
									.webEdit("Sites").assertValue "Type to search..."
									.webEdit("Sites").setValue strSites																									
									.assertListSearch MULTI_LIST_SITES,strSites
									 wait 5	
									.selectListItem MULTI_LIST_SITES,strSites1,"True"
									 wait 5
									 strSites1=testcasedata.getvalue("strSites1")
									.webEdit("Sites").assertValue strSites1
									.selectListItem MULTI_LIST_SITES,strSites1,"False"
									 wait 3
									
									 
									 
									
									.webEdit("SiteGroups").assertExist "True"
									.webEdit("SiteGroups").assertStatus "Visible"
									.webEdit("SiteGroups").assertValue "Type to search..."
									.webEdit("SiteGroups").setValue strSiteGroups
									 wait 5
									.assertListSearch MULTI_LIST_SITEGROUPS,strSiteGroups
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
									 wait 5
									 strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
									.webEdit("SiteGroups").assertValue strSiteGroups1
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"False"
									 wait 5
																	 
									
									.webEdit("ProviderIDs").assertExist "True"
									.webEdit("ProviderIDs").assertStatus "Visible"
									.webEdit("ProviderIDs").assertValue "Type to search..."
									.webEdit("ProviderIDs").setValue strProviderId
									 wait 5
									.assertListSearch MULTI_LIST_PROVIDERIDS,strProviderId
									.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
									 wait 5
									 strProviderId1=testcasedata.getvalue("strProviderId1")
									.webEdit("strProviderId1").assertValue strProviderId1
									.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"False"
									 wait 5
									
									 
									
									.webEdit("Campaigns").assertExist "True"
									.webEdit("Campaigns").assertStatus "Visible"
									.webEdit("Campaigns").assertValue "Type to search..."
									.webEdit("Campaigns").setValue strCampaign
									 wait 5
									.assertListSearch MULTI_LIST_CAMPAIGNS,strCampaign
									.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
									 wait 5
									 strCampaign1=testcasedata.getvalue("strCampaign1")
									.webEdit("Campaigns").assertValue strCampaign1
									.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"False"
									 wait 5
																	 
									 
									.webButton("Cancel").press
				
end with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementandProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "SCR_NEW_APD_TC_006"
