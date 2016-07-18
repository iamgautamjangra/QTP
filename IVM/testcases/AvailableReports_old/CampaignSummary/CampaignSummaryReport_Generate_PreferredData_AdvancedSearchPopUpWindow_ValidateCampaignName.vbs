'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCampaignName
' Description					:	Validate the campaign name filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_CSR_TC_019"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
					
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

							.weblink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("CampaignName").assertExist "True"
							.webEdit("CampaignName").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNNAME,""
							
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName1,"True"
							
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"True" '''all items selected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"False" '''all items deselected function
							
							strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")
							strCampaignName=testcasedata.getvalue("strCampaignName")
							
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAME,strCampaignNameAll,"False"
							
							.webLink("AdvClearAll").press
							wait 5	
							
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							wait 5
							
							.webLink("AdvSearch").press
							wait 5
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("CampaignName_CS").assertExist "True"
							
							.webTable("PreferredData_CS").assertExist "True"
							
							CampaignName= strCampaignName
							.webTable("PreferredData_CS").searchdata CampaignName
							wait 5
																													       
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
					.webButton("Cancel").press
					
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_CSR_TC_019"