'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_ValidateSites
' Description					:	Validate the Regions list box available on the "Campaign Summary" report.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateSites", "REP_CSR_TC_004"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS	
wait 10
 
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strSitesAll=testcasedata.getvalue("strSitesAll")

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							 wait 10	
							
							.webEdit("Sites").assertExist "True"
							.webEdit("Sites").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_SITES,"All","False"
							
							.assertListItems MULTI_LIST_SITES,""
							
							.selectListItem MULTI_LIST_SITES,strSites,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITES,strSites1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_SITES,strSites,"True"
							.validateSelectedListItem MULTI_LIST_SITES,strSites1,"True"
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"True" '''all items selected function
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" '''all items deselected function
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							strSites=testcasedata.getvalue("strSites")
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITES,strSites,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateSites", "REP_CSR_TC_004"