'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch
' Description					:	Validate the search available in customised column window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strSearchTerm=testcasedata.getvalue("strSearchTerm")
strSearchTerm2=testcasedata.getvalue("strSearchTerm2")
strSearchTerm3=testcasedata.getvalue("strSearchTerm3")
strSearchTerm4=testcasedata.getvalue("strSearchTerm4")
strSearchTerm5=testcasedata.getvalue("strSearchTerm5")
strSearchTerm6=testcasedata.getvalue("strSearchTerm6")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
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
						wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							.webTable("DetailedData_CS").pressColumnCustomization
							 wait 5
							
					        .webedit("CustomizeSearch").assertExist "True"
					        .webedit("CustomizeSearch").assertStatus "Visible"
					         wait 5
							
						    .webEdit("CustomizeSearch").setValue strSearchTerm						
						     wait 5
						    .assertExistWE strSearchTerm2,"True"
						     wait 3
						   
						    .webEdit("CustomizeSearch").setValue strSearchTerm3
						     wait 4
						    .assertExistWE strSearchTerm4,"True"	
						     wait 2
						   
						    .webEdit("CustomizeSearch").setValue strSearchTerm5
						     wait 4						   
						    .assertExistWE strSearchTerm6,"True"	
						     wait 4

							.webLink("CustomizeCancel").press
							 wait 5
						  
							.webLink("BackToPreviousPage").press	
						     wait 10
						   
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"