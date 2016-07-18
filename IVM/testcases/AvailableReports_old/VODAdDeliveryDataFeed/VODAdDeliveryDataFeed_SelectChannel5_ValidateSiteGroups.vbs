'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_SelectChannel5_ValidateSiteGroups
' Description					:	Validate "Site groups" List box.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_SelectChannel5_ValidateSiteGroups", "REP_VOD_TC_016"

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
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
		
							
							.webEdit("SiteGroups").assertExist "True"
							.webEdit("SiteGroups").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,"All","False"
							
							.assertListItems MULTI_LIST_SITEGROUPS,""
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITEGROUP,strSiteGroupsAll,"True" '''all items selected function
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" '''all items deselected function
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							strSiteGroups=testcasedata.getvalue("strSiteGroups")
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_SelectChannel5_ValidateSiteGroups", "REP_VOD_TC_016"