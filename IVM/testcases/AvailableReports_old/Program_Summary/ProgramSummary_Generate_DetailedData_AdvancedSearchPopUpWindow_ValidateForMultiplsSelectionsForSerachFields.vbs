'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_PSR_TC_051"


START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1

strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")
TimeRange_val=REPORT_START_DATE1
TimeRange_val1=REPORT_END_DATE1

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
							.selectDate reportProgramSummary,"StartDate",TimeRange_val

							.selectDate reportProgramSummary,"EndDate",TimeRange_val1
							wait 3
							.webLink("AdvSearch").press
							wait 5
					
'validate in table					
							.webTable("DetailedData_PS").searchData strProgramTitle
							
							.webTable("DetailedData_PS").searchData strCampaignName
							
							.webTable("DetailedData_PS").searchData strClockNumber
							
							.webTable("DetailedData_PS").searchData strProgramPID
							
							strFromTo= "From " & TimeRange_val & " to " & TimeRange_val1
					        .webTable("DetailedData_PS").searchData strFromTo
							
							.webTable("SearchCriteria_PS").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("ProgramTitle_PS").assertExist "True"
							.webLink("ProgramTitle_PS").assertStatus "Visible"
							
							.webLink("CampaignName_PS").assertExist "True"
							.webLink("CampaignName_PS").assertStatus "Visible"
							
							.webLink("ClockNumber_PS").assertExist "True"
							.webLink("ClockNumber_PS").assertStatus "Visible"
							
							.webLink("ProgramPID_PS").assertExist "True"
							.webLink("ProgramPID_PS").assertStatus "Visible"
							
							.webLink("TimeRange_PS").assertExist "True"
							.webLink("TimeRange_PS").assertStatus "Visible"
							
							.webLink("ClearAll_PS").assertExist "True"
							.webLink("ClearAll_PS").assertStatus "Visible"
							
							
					        .webLink("ProgramPID_PS").press
					         wait 5
							 
							 
							 .webTable("DetailedData_PS").searchData strProgramTitle
							
							.webTable("DetailedData_PS").searchData strCampaignName
							
							.webTable("DetailedData_PS").searchData strClockNumber
																				
							strFromTo= "From " & TimeRange_val & " to " & TimeRange_val1
					        .webTable("DetailedData_PS").searchData strFromTo
							
							
							.webLink("ProgramTitle_PS").assertExist "True"
							.webLink("ProgramTitle_PS").assertStatus "Visible"
							
							.webLink("CampaignName_PS").assertExist "True"
							.webLink("CampaignName_PS").assertStatus "Visible"
							
							.webLink("ClockNumber_PS").assertExist "True"
							.webLink("ClockNumber_PS").assertStatus "Visible"
							
							.webLink("TimeRange_PS").assertExist "True"
							.webLink("TimeRange_PS").assertStatus "Visible"
							
							
							
							.webLink("ClockNumber_PS").press
							.webLink("CampaignName_PS").press
					         wait 5
							 
							 
							 .webTable("DetailedData_PS").searchData strProgramTitle
																																
							strFromTo= "From " & TimeRange_val & " to " & TimeRange_val1
					        .webTable("DetailedData_PS").searchData strFromTo
							
							
							.webLink("ProgramTitle_PS").assertExist "True"
							.webLink("ProgramTitle_PS").assertStatus "Visible"
							
							.webLink("CampaignName_PS").assertExist "False"												
							.webLink("ClockNumber_PS").assertExist "False"
						
							.webLink("TimeRange_PS").assertExist "True"
							.webLink("TimeRange_PS").assertStatus "Visible"
							
											
					       	
							
							.webLink("BackToPreviousPage").press
						    wait 10
					        			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_PSR_TC_051"