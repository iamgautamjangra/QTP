'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_ValidateCampaigns
' Description					:	Validate the Campaigns multiselect list box.
' Author 						:   SeaChange
' Date 							: 05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_ValidateCampaigns", "REP_UCR_TC_016"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSeachValue=testcasedata.getvalue("strSeachValue")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
							 wait Wait10	
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
							end if
							.webTable("DataSet").presstblRadioBtn DataSet,1
	
							wait Wait10
						
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
							REM .webLink("FilterOptions").press
							REM wait Wait5
							
							.webEdit("Campaigns").assertExist "True"
							.webEdit("Campaigns").assertStatus "Visible"
							.webEdit("Campaigns").assertValue "Type to search..."
							
													
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True" '''all items selected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"False"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_ValidateCampaigns", "REP_UCR_TC_016"