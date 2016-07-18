'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
REM strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramSeriesTitle=testcasedata.getvalue("strProgramSeriesTitle")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportProgramSummary,3
					     wait 10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						REM .webLink("FilterOptions").press
							REM wait 5	
					   
					    .selectDate reportProgramSummary,"StartDate",START_DATE

						.selectDate reportProgramSummary,"EndDate",END_DATE
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						REM .webList("Grouping").selectItem strGrouping
						REM wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
							wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_PS").assertExist "True"
							wait 5	
							
                            .webLink("AdvancedSearch").press					
					        wait 3
					
							.webEdit("ProgramTitle").setValue strProgramTitle
							wait 3
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							wait 3
							.webEdit("ClockNumber").setValue strClockNumber
							wait 3
							
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							wait 3
													
							.webEdit("ProgramSeriesTitle").setValue strProgramSeriesTitle
							wait 3
							
											
							.selectDate reportProgramSummary,"StartDate",START_DATE

							.selectDate reportProgramSummary,"EndDate",END_DATE
							wait 3
					
							.webLink("AdvClearAll").press							  
							  wait 5
							
							.webEdit("ProgramTitle").assertvalue ""
							 wait 3
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.validateSelectedListItem MULTI_LIST_CAMPAINNAME,strCampaignName,"False"
							 wait 3
							 .webEdit("CampaignName").assertValue "Type to search"
							 
				            .webEdit("ClockNumber").assertValue ""
							 wait 3
							 .validateSelectedListItem MULTI_LIST_PRAGRAMPID,strProgramPID,"False"
							 wait 3
							.webEdit("ProgramPID").assertValue "Type to search"
							.webEdit("ProgramSeriesTitle").assertValue ""
													
						   						
							.webEdit("Between").assertValue ""
							wait 3
							.webEdit("And").assertValue ""
							wait 3
							
							.webLink("AdvCancel").press
							wait 5
							
							.webLink("BackToPreviousPage").press
							wait 10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							wait 5
End with				
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"