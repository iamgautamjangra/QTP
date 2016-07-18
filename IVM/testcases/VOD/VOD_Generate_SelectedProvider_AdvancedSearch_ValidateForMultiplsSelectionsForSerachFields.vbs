' (c) Copyright Fonantrix Solution
'
' File Name						:	VOD_Generate_SelectedProvider_AdvancedSearch_ValidateForMultiplsSelectionsForSerachFields 
' Description					:   Validate Advanced Search functionality for "Channel 4 Data" page
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvider_AdvancedSearch_ValidateForMultiplsSelectionsForSerachFields ", "REP_VOD_TC_033"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

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
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaign2=testcasedata.getvalue("strCampaign2")


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
							wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI, strCampaign1, "True"
							wait Wait2
							.webEdit("RegionName_Adv").setValue strRegion
							
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							.webElement("ContentReference_Filter").assertExist "True"
							If len(strContentReference)>9 then 
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& mid(strContentReference,1,8) &".." &"   X"
							
							Else
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& strContentReference &"   X"
							
							End If
							
							.webElement("CampaignReference_Filter").assertExist "True"
							If len(strCampaignReference)>9 then 
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& mid(strCampaignReference,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& strCampaignReference &"   X"
							
							End If
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaign1)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaign1,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaign1 &"   X"
							
							End If
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegion)>9 then 
							.webElement("RegionName_Filter").assertText  "Region ="& mid(strRegion,1,8) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region ="& strRegion &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
							
							.webTable("ProviderData").assertValue strContentReference,"3"
							.webTable("ProviderData").assertValue strCampaignReference,"5"
							.webTable("ProviderData").assertValue strCampaign1,"6"
							.webTable("ProviderData").assertValue strRegion,"4"
							wait Wait5	
							
							'.webTable("ProviderData").assertDelValue strContentReference1
							'.webTable("ProviderData").assertDelValue strCampaignReference1
							.webTable("ProviderData").assertDelValue strCampaign2
							'.webTable("ProviderData").assertDelValue strRegion1
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ContentReference_Filter").assertExist "False"
							.webElement("CampaignReference_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							 
							.webTable("ProviderData").assertValue strContentReference1,"3"
							.webTable("ProviderData").assertValue strCampaignReference1,"5"
							.webTable("ProviderData").assertValue strCampaign2,"6"
							.webTable("ProviderData").assertValue strRegion1,"4"
End With					

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvider_AdvancedSearch_ValidateForMultiplsSelectionsForSerachFields", "REP_VOD_TC_033"
