'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementSummary_ValidateSiteGroups
' Description					:	Validate "Site groups" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_ValidateSiteGroups", "SCR_EDIT_ASR_TC_003"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testcasedata.getvalue("SearchVal")
strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")

 With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink  SearchVal,"Edit Options",6
									 wait 10	
									 
									 .webRadiogroup("Site_SiteGroup").selectGroupItem "SiteGroups"
									
									wait Wait2
									
									.webEdit("SiteGroups").assertExist "True"
									.webEdit("SiteGroups").assertStatus "Visible"
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
									 wait Wait2
									 
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False"
									 wait Wait2
									
															
									.assertListItems MULTI_LIST_SITEGROUPS & ";" & reportAdvertisementandProgramDetails,""
							           wait Wait5
							        .assertListDGWDB MULTI_LIST_SITEGROUPS & ";"& reportAdvertisementandProgramDetails, ""
							           wait Wait5
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
									 wait Wait2
									 
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
									 wait Wait2
									 
									strSiteGroups=testcasedata.getvalue("strSiteGroups")
									strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
									
									.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
									.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
									
									
									strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
									 wait Wait2
									.validateSelectedListItem MULTI_LIST_SITEGROUP,strSiteGroupsAll,"True" '''all items selected function
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False"
									 wait Wait2
									.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" '''all items deselected function
									
									strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
									strSiteGroups=testcasedata.getvalue("strSiteGroups")
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
									 wait Wait2
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"False"
									 wait Wait2
									.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" 	
									
									.webButton("Cancel").press
wait 5
End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_ValidateSiteGroups", "SCR_EDIT_ASR_TC_003"
