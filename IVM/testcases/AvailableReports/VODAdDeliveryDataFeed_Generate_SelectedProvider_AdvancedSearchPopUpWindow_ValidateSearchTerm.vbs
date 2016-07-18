' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateSearchTerm 
' Description					:   Validate Advanced Search functionality for "Channel 4 Data" page
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateSearchTerm ", "REP_VOD_TC_031"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strSearchTermValid=testcasedata.getvalue("strSearchTermValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")
strSearchTermInValid=testcasedata.getvalue("strSearchTermInValid")

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
										
						
						REM .selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						REM wait Wait3
						
					
						
						.webButton("Generate").press
						wait Wait8
End with 


With ivm.page(PreferredData_page)


							.assertExistLNK strProvider,"True","Press"
							wait Wait7
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "visible"
							
							.webEdit("SearchTerm_Adv").setValue strSearchTermInValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("ProviderData").assertExist "True"													
					        .webTable("ProviderData").searchData NoRecordFound_msg
							wait Wait5
							
							
							.webElement("SearchTerm_Filter").assertExist "True"
							If len(strSearchTermInValid)>9 then 
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& mid(strSearchTermInValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& strSearchTermInValid &"   X"
							End If
							
							.webElement("SearchTerm_Filter").assertExist "True"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							.webLink("ClearAll").press
							
														
							
							
'Search with valid data							
							
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("SearchTerm_Adv").setValue strSearchTermValid
							.webLink("AdvSearch").press
							 wait Wait5
													
							.webTable("ProviderData").assertExist "True"													
					        .webTable("ProviderData").assertValue strSearchTermValid,"3"
							wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "True"
							If len(strSearchTermValid)>9 then 
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& mid(strSearchTermValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& strSearchTermValid &"   X"
							End If
							
							.webElement("SearchTerm_Filter").assertExist "True"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							.webLink("ClearAll").press
							
							wait Wait3										
					       .webLink("BackToPreviousPage").press
						    wait Wait10
End With
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait Wait10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
End With	

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_VOD_TC_031"
