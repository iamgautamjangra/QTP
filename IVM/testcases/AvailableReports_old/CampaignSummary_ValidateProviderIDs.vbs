'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_ValidateProviderIDs
' Description					:	Validate the Regions list box available on the "Campaign Summary" report.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_ValidateProviderIDs", "REP_CSR_TC_014"


DataSet=testcasedata.getvalue("DataSet")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")
strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							 wait Wait5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait Wait5
							
							.webEdit("ProviderIDs").assertExist "True"
							.webEdit("ProviderIDs").assertStatus "Visible"
							
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,"All","False"
							wait Wait2
							
							.assertListItems MULTI_LIST_PROVIDERIDS,""
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" '''all items selected function
							
							.webEdit("ProviderIDs").assertValue "Type to search..."
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" '''all items deselected function
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							strProviderId=testcasedata.getvalue("strProviderId")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" 	
							
							.webButton("Cancel").press
							
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_ValidateProviderIDs", "REP_CSR_TC_014"