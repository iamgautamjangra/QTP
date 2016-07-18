' (c) Copyright Fonantrix Solution
'
' File Name						:	VOD_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignReference 
' Description					:   Validate "Campaign Reference " text box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignReference ", "REP_VOD_TC_027"
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
strCampaignReference=testcasedata.getvalue("strCampaignReference")
strCampaignReference1=testcasedata.getvalue("strCampaignReference1")
strCampaignReferenceInv=testcasedata.getvalue("strCampaignReferenceInv")

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
					    REM .webList("Provider").selectItem strProvider
						 REM wait Wait5		
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
							
							.webEdit("CampaignReference_Adv").setValue strCampaignReference
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("CampaignReference_Filter").assertExist "True"
							If len(strCampaignReference)>9 then 
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& mid(strCampaignReference,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& strCampaignReference &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
							
						
							.webTable("ProviderData").assertValue strCampaignReference,"5"
							wait Wait5	
							'.webTable("ProviderData").assertDelValue strCampaignReference1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("CampaignReference_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("ProviderData").assertValue strCampaignReference1,"5"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("CampaignReference_Adv").setValue strCampaignReferenceInv
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("CampaignReference_Filter").assertExist "True"
							If len(strCampaignReferenceInv)>9 then 
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& mid(strCampaignReferenceInv,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignReference_Filter").assertText  "Campaign Reference ="& strCampaignReferenceInv &"   X"
							End If
							
							.webElement("CampaignReference_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
						
							.webTable("ProviderData").searchData NoRecordFound_msg
							
							.webTable("ProviderData").assertDelValue strCampaignReference
							'.webTable("ProviderData").assertDelValue strCampaignReference1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("CampaignReference_Filter").assertExist "False"
							
							
							'.webLink("ClearAll").assertExist "False"
							
							'.webTable("ProviderData").assertValue strCampaignReference,"5"
							
							.webTable("ProviderData").assertValue strCampaignReference1,"5"
							
							.webTable("ProviderData").assertDelValue NoRecordFound_msg		
					        
					
End with
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateCampaignReference", "REP_VOD_TC_027"
