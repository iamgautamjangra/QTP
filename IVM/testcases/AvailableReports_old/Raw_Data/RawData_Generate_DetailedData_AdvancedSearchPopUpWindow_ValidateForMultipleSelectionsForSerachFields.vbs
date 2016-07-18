'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   28-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RDR_TC_062"


START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1

strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")
CampaignStartDate_val=REPORT_CampaignStartDate_val1
CampaignStartDate_val1=REPORT_CampaignStartDate_val11

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportRawData,3
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
						REM .webLink("FilterOptions").press
						REM wait 5
					   
					    .selectDate reportRawData,"StartDate",START_DATE

						.selectDate reportRawData,"EndDate",END_DATE
						
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
							
							.webTable("DetailedData_RD").assertExist "True"
							wait 5	
							
                            .webLink("AdvancedSearch").press					
					        wait 3
					
							.webEdit("ElementNumber").setValue strElementNumber
							wait 3
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							wait 3
							.webEdit("ClockNumber").setValue strClockNumber
							wait 3
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							wait 3
							.selectDate reportRawData,"StartDate",CampaignStartDate_val

							.selectDate reportRawData,"EndDate",CampaignStartDate_val1
							wait 3
							.webLink("AdvSearch").press
							wait 5
					
'validate in table					
							.webTable("DetailedData_RD").searchData strElementNumber
							
							.webTable("DetailedData_RD").searchData strCampaignName
							
							.webTable("DetailedData_RD").searchData strClockNumber
							
							.webTable("DetailedData_RD").searchData strProgramPID
							
							strFromTo= "From " & CampaignStartDate_val & " to " & CampaignStartDate_val1
					        .webTable("DetailedData_RD").searchData strFromTo
							
							.webTable("SearchCriteria_RD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("ElementNumber_RD").assertExist "True"
							.webLink("ElementNumber_RD").assertStatus "Visible"
							
							.webLink("CampaignName_RD").assertExist "True"
							.webLink("CampaignName_RD").assertStatus "Visible"
							
							.webLink("ClockNumber_RD").assertExist "True"
							.webLink("ClockNumber_RD").assertStatus "Visible"
							
							.webLink("ProgramPID_RD").assertExist "True"
							.webLink("ProgramPID_RD").assertStatus "Visible"
							
							.webLink("CampaignStartDate_RD").assertExist "True"
							.webLink("CampaignStartDate_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							
					        .webLink("ProgramPID_RD").press
					         wait 5
							 
							 
							 .webTable("DetailedData_RD").searchData strElementNumber
							
							.webTable("DetailedData_RD").searchData strCampaignName
							
							.webTable("DetailedData_RD").searchData strClockNumber
																				
							strFromTo= "From " & CampaignStartDate_val & " to " & CampaignStartDate_val1
					        .webTable("DetailedData_RD").searchData strFromTo
							
							
							.webLink("ElementNumber_RD").assertExist "True"
							.webLink("ElementNumber_RD").assertStatus "Visible"
							
							.webLink("CampaignName_RD").assertExist "True"
							.webLink("CampaignName_RD").assertStatus "Visible"
							
							.webLink("ClockNumber_RD").assertExist "True"
							.webLink("ClockNumber_RD").assertStatus "Visible"
							
							.webLink("CampaignStartDate_RD").assertExist "True"
							.webLink("CampaignStartDate_RD").assertStatus "Visible"
							
							
							
							.webLink("ClockNumber_RD").press
							.webLink("CampaignName_RD").press
					         wait 5
							 
							 
							 .webTable("DetailedData_RD").searchData strElementNumber
																																
							strFromTo= "From " & CampaignStartDate_val & " to " & CampaignStartDate_val1
					        .webTable("DetailedData_RD").searchData strFromTo
							
							
							.webLink("ElementNumber_RD").assertExist "True"
							.webLink("ElementNumber_RD").assertStatus "Visible"
							
							.webLink("CampaignName_RD").assertExist "False"												
							.webLink("ClockNumber_RD").assertExist "False"
						
							.webLink("CampaignStartDate_RD").assertExist "True"
							.webLink("CampaignStartDate_RD").assertStatus "Visible"
							
											
					       	
							
							.webLink("BackToPreviousPage").press
						    wait 10
					        			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RDR_TC_062"