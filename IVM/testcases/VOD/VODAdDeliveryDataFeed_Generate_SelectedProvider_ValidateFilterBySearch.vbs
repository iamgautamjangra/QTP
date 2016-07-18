' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateFilterBySearch 
' Description					:   Validate "Campaign Name" List box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateFilterBySearch ", "REP_VOD_TC_029"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
SearchTermBlank=testcasedata.getvalue("SearchTermBlank")

strTimeRange=testcasedata.getvalue("strTimeRange")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
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
							  wait Wait5
														
							
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "visible"
							
							strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
							.webEdit("SearchTerm_Adv").setValue strSearchInvalid
							
							.webLink("AdvancedSearch").press
							wait Wait3			
													
													 
							 .webElement("SearchTerm_filterDetail").assertExist "True"
							If len(strSearchInvalid)>9 then 
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& mid(strSearchInvalid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& strSearchInvalid &"   X"
							
							End If
												
							
							.webTable("ProviderData").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertStatus "Visible"
							
								.webTable("ProviderData").searchData NoRecordFound_msg											
					       
							wait Wait5
							
							.webLink("ClearAll").press
							wait Wait7
														
							.webElement("SearchTerm_filterDetail").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							
							strSearchValid=testcasedata.getvalue("strSearchValid")
							.webEdit("SearchTerm_Adv").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							 .webElement("SearchTerm_filterDetail").assertExist "True"
							If len(strSearchValid)>9 then 
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& mid(strSearchValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& strSearchValid &"   X"
							
							End If
												
							
							.webTable("ProviderData").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertStatus "Visible"
												
							
							.webLink("ClearAll").press
							wait Wait2
							
							.webElement("SearchTerm_filterDetail").assertExist "False"

							.webLink("BackToPreviousPage").press
							wait wait2

							
End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateFilterBySearch", "REP_VOD_TC_029"
