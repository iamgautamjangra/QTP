'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_ValidateCampaigns
' Description					:	Validate the Campaigns multiselect list box.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateCampaigns", "REP_APD_TC_016"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignAll=testcasedata.getvalue("strCampaignAll")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADPROGRAMDETAILS
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							wait Wait5
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
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							wait 1
							.webLink("AdvSearch").press
							wait Wait3
							End If
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait5

							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"

							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,"All","False"

							.assertListItems MULTI_LIST_CAMPAIGNNAMES_APD &";"&DataSet,""

							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							wait Wait5

							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"

							strCampaignAll=testcasedata.getvalue("strCampaignAll")

							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"True"
							wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"							'''all items selected function

							strCampaignAll=testcasedata.getvalue("strCampaignAll")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"False"
							wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"False"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"

							strCampaignAll=testcasedata.getvalue("strCampaignAll")
							strCampaign=testcasedata.getvalue("strCampaign")

							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"True"
							wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"False"
							wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignAll,"False" 	

							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateCampaigns", "REP_APD_TC_016"