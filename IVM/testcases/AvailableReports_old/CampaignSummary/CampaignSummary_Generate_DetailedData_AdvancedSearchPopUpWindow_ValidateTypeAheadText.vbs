'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_048"

strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						wait 10   
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
						
						.webLink("FilterOptions").assertExist "True"
					    .webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").press
						wait 5
						   
					    .selectDate reportCampaignSummary,"StartDate",START_DATE

						.selectDate reportCampaignSummary,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						.webList("Grouping").selectItem strGrouping
						wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							 wait 4
							 
							.webTable("DetailedData_CS").assertExist "True"
							 wait 5
							 
							.webLink("AdvancedSearch").press
							  wait 5
							  
							.webEdit("CampaignName").assertExist "True"
							.webEdit("CampaignName").assertStatus "Visible"							 
							.webEdit("CampaignName").assertValue "Type to search..."																							
							.webEdit("CampaignName").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAINNAME,strCampaignName
                            wait 5	
							.selectlistItem MULTI_LIST_CAMPAINNAME,strCampaignName1 "True"
							wait 5
							strCampaignName1=testcasedata.getvalue("strCampaignName1")
							.webEdit("CampaignName").assertValue strCampaignName1
							.selectListItem MULTI_LIST_CAMPAINNAME,strCampaignName1,"False"
							 wait 3
							.webEdit("CampaignName").assertValue "Type to search..."
							 wait 3	

							.webLink("AdvCancel").press							  
							wait 5	
						  	
							.webTable("DetailedData_CS").assertExist "True"
							wait 5			
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)		
							
							.webButton("Cancel").press
							 wait 5
							 
End with							 
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_048"