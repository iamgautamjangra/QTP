' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateTypeAheadText 
' Description					:   Validate the Functionality of "Type Ahead Text" on the Advanced Search Popup Window at "Channel 4 Data"  page.
' Author 						:   SeaChange
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateTypeAheadText ", "REP_VOD_TC_030"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strRegionInv=testcasedata.getvalue("strRegionInv")

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
													
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAME,strCampaignName
                            wait Wait5	
							.selectlistItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1,"True"
							wait Wait5
							strCampaignName1=testcasedata.getvalue("strCampaignName1")
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1,"False"
							 wait Wait3
							'.webEdit("CampaignName_Adv").assertValue "Type to search..."
							 'wait Wait3
							  											
                            .webLink("AdvCancel").press							  
							
						  
End with

			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_VOD_TC_030"
