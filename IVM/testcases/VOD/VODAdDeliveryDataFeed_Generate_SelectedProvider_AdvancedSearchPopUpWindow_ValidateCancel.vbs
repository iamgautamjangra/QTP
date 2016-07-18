' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCancel 
' Description					:   Validate "Cancel" functionality in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCancel ", "REP_VOD_TC_034"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strRegion=testcasedata.getvalue("strRegion")
strRegion1=testcasedata.getvalue("strRegion1")
strContentReference=testcasedata.getvalue("strContentReference")
strContentReference1=testcasedata.getvalue("strContentReference1")
strCampaignReference=testcasedata.getvalue("strCampaignReference")
strCampaignReference1=testcasedata.getvalue("strCampaignReference1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_VODADDELIVERYDATAFEED
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
					    .webList("Provider").selectItem strProvider
						 wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8
End with	


With ivm.page(PreferredData_page)	

							
							.assertExistLNK strProvider,"True","Press"
							wait Wait7
							
							.webTable("ProviderData").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ContentReference_Adv").setValue strContentReference
							.webEdit("CampaignReference_Adv").setValue strCampaignReference
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI, strCampaign1, "True"
							.webEdit("RegionName_Adv").setValue strRegion
							
						    wait Wait5
							.webLink("AdvCancel").press
							wait Wait5	
							
							.webElement("ContentReference_Filter").assertExist "False"
							.webElement("CampaignReference_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("ProviderData").assertValue strContentReference1,"3"
							.webTable("ProviderData").assertValue strCampaignReference1,"5"
							.webTable("ProviderData").assertValue strCampaign,"6"
							.webTable("ProviderData").assertValue strRegion1,"4"
End With					

executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCancel", "REP_VOD_TC_034"
