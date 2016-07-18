'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_ValidateCampaigns
' Description					:	Validate the Regions list box available on the "Campaign Summary" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateCampaigns", "REP_CSR_TC_007"

strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							 wait 10	
							
							.webEdit("Campaigns").assertExist "True"
							.webEdit("Campaigns").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNS,""
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True" '''all items selected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" '''all items deselected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_ValidateCampaigns", "REP_CSR_TC_007"