'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search in the advanced search multiselect listbox.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_031"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
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
                        wait 5
						.selectDate reportCampaignSummary,"EndDate",END_DATE		
						wait 5                     							
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 5						
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5							
						.webList("Grouping").selectItem strGrouping
						wait 3
						.webEdit("Comments").setValue strComments
						wait 5						
						.webButton("Generate").press
						wait 8
						
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							wait 4
							 
							.webTable("PreferredData_CS").assertExist "True"
							 wait 5
							 
							.webLink("AdvancedSearch").press
							  wait 5
					
							
							.webEdit("CampaignName").assertExist "True"
							.webEdit("CampaignName").assertStatus "Visible"
							.webEdit("CampaignName").assertValue "Type to search..."																							
							.webEdit("CampaignName").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAME,strCampaignName
                            wait 5	
							.selectlistItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1 "True"
							wait 5
							strCampaignName1=testcasedata.getvalue("strCampaignName1")
							.webEdit("CampaignName").assertValue strCampaignName1
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1,"False"
							 wait 3
							.webEdit("CampaignName").assertValue "Type to search..."
							 wait 3
							  											
                            .webLink("AdvCancel").press							  
							wait 5	
						  	
							.webTable("PreferredData_CS").assertExist "True"
							wait 5			
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)		
							
							.webButton("Cancel").press
							 wait 5
							 
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_031"