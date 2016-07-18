' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateClearAll 
' Description					:   Validate "Clear All" functionality in the Advanced Search Popup Window.
' Author 						:   SeaChange
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateClearAll ", "REP_VOD_TC_034"
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
strContentReference=testcasedata.getvalue("strContentReference")
strCampaignReference=testcasedata.getvalue("strCampaignReference")
strCampaign=testcasedata.getvalue("strCampaign")


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
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI, strCampaign, "True"
							.webEdit("RegionName_Adv").setValue strRegion
							
						    
							.webLink("AdvClearAll").press
							wait Wait2	
							
							.webEdit("ContentReference_Adv").assertValue ""
							.webEdit("CampaignReference_Adv").assertValue ""
							.webEdit("CampaignName_Adv").assertValue "Type to search..."
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI, strCampaign, "False"
							.webEdit("RegionName_Adv").assertValue ""
							
							.webLink("AdvCancel").press
							
End With				

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_VOD_TC_034"
