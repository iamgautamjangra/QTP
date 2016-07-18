' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignName 
' Description					:   Validate "Campaign Name" List box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignName ", "REP_VOD_TC_029"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
strCampaignName1=testcasedata.getvalue("strCampaignName1")

DataSet=DATASET_VODADDELIVERYDATAFEED
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
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
									
									
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait2
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					    REM '.webList("Provider").selectItem strProvider
						 REM 'wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8
End with	



With ivm.page(PreferredData_page)

'Search with valid data
							.assertExistLNK strProvider,"True","Press"
							wait Wait7
							
							.webLink("AdvancedSearch").press
							wait Wait3
							
													
							.webElement("CampaignName_Adv").assertExist "True"
							.webElement("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNNAMES_VOD & ";"& DataSet,""							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True" '''all items selected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False" '''all items deselected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							strCampaignName=testcasedata.getvalue("strCampaignName")
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignNameAll,"False"
							
							.webLink("AdvClearAll").press
							wait Wait2	
							
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							wait Wait5
							
							.webLink("AdvSearch").press
							wait Wait5
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
							
						
							.webTable("ProviderData").assertValue strCampaignName,"6"
							wait Wait5	
							.webTable("ProviderData").assertDelValue strCampaignName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("CampaignName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("ProviderData").assertValue strCampaignName,"6"
							'.webTable("ProviderData").assertValue strCampaignName1,"6"
							
End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_VOD_TC_029"
