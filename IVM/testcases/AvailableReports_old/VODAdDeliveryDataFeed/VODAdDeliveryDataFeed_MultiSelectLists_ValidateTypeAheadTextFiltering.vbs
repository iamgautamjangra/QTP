'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "MultiSelect Type Ahead Text"
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_VOD_TC_019"

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							wait 10
							
							.webTable("SelectaDatasetforThisReport").assertExist "True"
						    .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "DataCreation","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                            .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
												 											 
						    .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
							.webLink("FilterOptions").assertExist "True"
						    .webLink("FilterOptions").assertStatus "Visible"
							.webLink("FilterOptions").press
							wait 5
							
						    .webList("SelectaProveder").assertExist "True"
						    .webList("SelectaProveder").selectItem strProvider
							 wait 5
		
							
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
							.webEdit("Sites").assertValue "Type to search..."
							 wait 3
							 
							 
							.webradioGroup("SiteGroups").selectGroupItem "Site groups"
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
							.webEdit("SiteGroups").assertValue "Type to search..."
							 wait 3
							 
																					
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
							.webEdit("Campaigns").assertValue "Type to search..."
							 wait 3						
							
End With

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_VOD_TC_019"			
