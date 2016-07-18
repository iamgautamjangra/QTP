'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_ValidateSiteGroups
' Description					:	Validate the Regions list box available on the "Raw data" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_ValidateSiteGroups", "REP_CSR_TC_005"

strSiteGroups=testcasedata.getvalue("strSiteGroups")
strSiteGroups1=testcasedata.getvalue("strSiteGroups1")
strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait10	
							
							.webEdit("SiteGroups").assertExist "True"
							.webEdit("SiteGroups").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,"All","False"
							
							.assertListItems MULTI_LIST_SITEGROUPS,""
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroups1,"True"
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_SITEGROUP,strSiteGroupsAll,"True" '''all items selected function
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" '''all items deselected function
							
							strSiteGroupsAll=testcasedata.getvalue("strSiteGroupsAll")
							strSiteGroups=testcasedata.getvalue("strSiteGroups")
							
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_SITEGROUPS,strSiteGroupsAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_ValidateSiteGroups", "REP_CSR_TC_005"