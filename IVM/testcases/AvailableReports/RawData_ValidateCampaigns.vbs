'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_ValidateCampaigns
' Description					:	Validate the Regions list box available on the "Raw Data" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_ValidateCampaigns", "REP_CSR_TC_007"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait5

						 
								.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								 wait wait10
						
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
							
							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNNAMES_RD &";"& DataSet,""
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"True"
                            .validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"							'''all items selected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"False"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_ValidateCampaigns", "REP_CSR_TC_007"