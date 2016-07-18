'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AllDetails_ValidateSiteGroups
' Description					:	Validate "Site groups" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateSiteGroups", "SCR_NEW_ADR_TC_003"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 25


strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")



 With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportAllDetails
									 wait Wait10	
									.selectDate "FirstDate", FIRST_DATE
									wait Wait3									
									.selectDate "LastDate", LAST_DATE
									 wait Wait3
									.webRadiogroup("Site_SiteGroup").selectGroupItem "SiteGroups"
									
									wait Wait5
									.webEdit("SiteGroups").assertExist "True"
									.webEdit("SiteGroups").assertStatus "Visible"
									
									.validateSelectedListItem MULTI_LIST_SITEGROUPS,"All","False"
									
									.assertListItems MULTI_LIST_SITEGROUPS & ";" & reportAllDetails,""
							           wait Wait5
							         .assertListDGWDB MULTI_LIST_SITEGROUPS & ";"& reportAllDetails, ""
							           wait Wait5
									
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
																	 
									.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
																		 
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
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateSiteGroups", "SCR_NEW_ADR_TC_003"
