'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Program PID filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_046"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
ProgramPID_val=testcasedata.getvalue("ProgramPID_val")
ProgramPID=testcasedata.getvalue("ProgramPID")
ProgramPIDInv=testcasedata.getvalue("ProgramPIDInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

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
						wait 8
End with 

With ivm.page(reportgen_page)

							.webLink("DetailedData").press
							wait 5
							
							.webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("ProgramPID").assertExist "True"
							.webEdit("ProgramPID").assertStatus "Visible"
						
							.webEdit("ProgramPID").setValue ProgramPID
						    wait 5
							
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ProgramPID_CS").assertExist "True"
							
							.webTable("DetailedData_CS").assertExist "True"
							
							strProgram= ProgramPID
							.webTable("DetailedData_CS").assertTableData 'TBD strProgram
							wait 5	
'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramPID").setValue ProgramPIDInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("ProgramPID_CS").assertExist "True"
							
							.webTable("DetailedData_CS").assertExist "True"
							.webTable("DetailedData_CS").assertvalue "No data exists for the selected criteria."
							wait 5
							
					        .webLink("BackToPreviousPage").press
							wait 10
							
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							 wait 5
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_046"