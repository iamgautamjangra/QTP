'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_CSR_TC_035"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportCampaignSummary,3
					    wait 10
					     
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
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(reportgen_page)	

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							
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
							
'select list value and validate 
							
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							wait 
							
							.webLink("AdvSearch").press
							wait 5
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("CampaignName_CS").assertExist "True"
							
							.webTable("DetailedData_CS").assertExist "True"
							
							CampaignName= strCampaignName
							.webTable("DetailedData_CS").searchdata CampaignName
							wait 5
																													       
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
					.webButton("Cancel").press
					
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignName", "REP_CSR_TC_035"