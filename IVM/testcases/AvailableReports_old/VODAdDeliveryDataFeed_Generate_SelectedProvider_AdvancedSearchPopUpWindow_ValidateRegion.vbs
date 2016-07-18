' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateRegion 
' Description					:   Validate "Region" List box in the Advanced Search Popup Window.
' Author 						:   SeaChange
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateRegion ", "REP_VOD_TC_030"
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
							
							.webEdit("RegionName_Adv").setValue strRegion
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegion)>9 then 
							.webElement("RegionName_Filter").assertText  "Region ="& mid(strRegion,1,8) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region ="& strRegion &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
							
						
							.webTable("ProviderData").assertValue strRegion,"4"
							wait Wait5	
							'.webTable("ProviderData").assertDelValue strRegion1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("RegionName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("ProviderData").assertValue strRegion1,"4"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("RegionName_Adv").setValue strRegionInv
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionInv)>9 then 
							.webElement("RegionName_Filter").assertText  "Region ="& mid(strRegionInv,1,8) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region ="& strRegionInv &"   X"
							End If
							
							.webElement("RegionName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
						
							.webTable("ProviderData").searchData NoRecordFound_msg
							
							.webTable("ProviderData").assertDelValue strRegion
							.webTable("ProviderData").assertDelValue strRegion1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("RegionName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("ProviderData").assertValue strRegion,"4"
							
							.webTable("ProviderData").assertValue strRegion1,"4"
							
							.webTable("ProviderData").assertDelValue NoRecordFound_msg
							
					        
							
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateRegion", "REP_VOD_TC_030"
