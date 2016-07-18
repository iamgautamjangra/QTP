'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_ValidateUIControls 
' Description					:	Validate the UIControls on preffered data page.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateUIControls", "REP_CSR_TC_022"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

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
						
						.webbutton("Generate").press 
						 wait 8
						
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							 wait 5

							.webTable("PreferredData_CS").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("PreferredData_CS").assertExist "True"
							.webTable("PreferredData_CS").assertStatus "Visible"
							
							.webTable("PreferredDataHeader_CS").assertColumnExist "Time Range", "True"
							
							.webTable("PreferredDataHeader_CS").assertColumnExist "Element Number", "True"
							
							.webTable("PreferredDataHeader_CS").assertColumnExist "Program PID", "True"
							
							.webTable("PreferredDataHeader_CS").assertColumnExist "Campaign Name", "True"
							
							.webLink("BackToPreviousPage").press
							wait 10
							
End with	

with ivm.page(report_page)

							.webButton("Cancel").press

End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateUIControls", "REP_CSR_TC_022"