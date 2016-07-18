'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate 
' Description					:	Validate the date range filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate ", "REP_RDR_TC_038"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
CampaignStartDate_Inv=testcasedata.getvalue("CampaignStartDate_Inv")
CampaignStartDate_Inv1=testcasedata.getvalue("CampaignStartDate_Inv1")
CampaignStartDate_val1=testcasedata.getvalue("CampaignStartDate_val1")
CampaignStartDate_val=testcasedata.getvalue("CampaignStartDate_val")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait 10  
						   
					    .selectDate reportRawData,"StartDate",START_DATE

						.selectDate reportRawData,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
					
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RD").assertExist "True"
							
							.webLink("AdvancedSearch").press
							wait 5	
							
							.selectDate reportRawData,"StartDate",CampaignStartDate_val	
							wait 5
							.selectDate reportRawData,"EndDate",CampaignStartDate_val1
							wait 5
							.webLink("AdvSearch").press
							 wait 5		
							 
							.webTable("SearchCriteria_RD").assertExist "True" 
							.webTable("SearchCriteria_RD").assertStatus "Visible"
							
							.webLink("CampaignStartDate_RD").assertExist "True"
							.webLink("CampaignStartDate_RD").assertStatus "Visible"
							 
							 strFromTo= "From " & CampaignStartDate_val & " to " & CampaignStartDate_val1	
							 
							.webTable("DetailedData_RD").searchData strFromTo
							wait 5
							
' For invalid							
							.webLink("AdvancedSearch").press					
							 wait 5	
							 
							.selectDate reportRawData,"StartDate",CampaignStartDate_Inv	
							wait 5							
							.selectDate reportRawData,"EndDate",CampaignStartDate_Inv1	
							wait 5
							.webLink("AdvSearch").press					
							 wait 5		
							 
							.webTable("SearchCriteria_RD").assertExist "True" 
							.webTable("SearchCriteria_RD").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertvalue "No data exists for the selected criteria."
							 wait 5
							 
							.webLink("BackToPreviousPage").press
							 wait 10
End with

with ivm.page(report_page)	
							
							.webButton("Cancel").press
							wait 5
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate ", "REP_RDR_TC_038"