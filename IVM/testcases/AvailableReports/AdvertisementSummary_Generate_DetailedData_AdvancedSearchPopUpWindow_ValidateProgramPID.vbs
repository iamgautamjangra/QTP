'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   04-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ASR_TC_044"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
REM strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait 5
					     
					    .selectDate reportAdvertisementSummary,"StartDate",START_DATE

						.selectDate reportAdvertisementSummary,"EndDate",END_DATE
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						REM .webList("Grouping").selectItem strGrouping
						REM wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(reportgen_page)	

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_AS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramPID").assertExist "True"
							.webEdit("ProgramPID").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID,""
							.webEdit("ProgramPID").assertValue "Type to search..."
							
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							 wait 5
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,strProgramPID1,"True"
							
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"True" '''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"False" '''all items deselected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID,strProgramPIDAll,"False"
							
							.webLink("AdvClearAll").press
							wait 5	
							
'select list value and validate 
							
							strProgramPID=testcasedata.getvalue("strProgramPID")
							.selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							wait 
							
							.webLink("AdvSearch").press
							wait 5
							
							.webTable("DetailedData_AS").assertExist "True"													
							ProgramPID= strProgramPID
							.webTable("DetailedData_AS").searchData ProgramPID
							wait 5
											
							.webTable("SearchCriteria_AS").assertExist "True" 
							.webTable("SearchCriteria_AS").assertStatus "Visible"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.weLink("ProgramPID_AS").assertExist "True"
							.webLink("ProgramPID_AS").assertStatus "Visible"
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("ProgramPID_AS").press							
							 wait 5
							
							.webLink("ProgramPID_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
							
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
					.webButton("Cancel").press
					
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ASR_TC_044"