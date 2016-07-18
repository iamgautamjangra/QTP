'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_PSR_TC_032"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
REM strGrouping=testcasedata.getvalue("strGrouping")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strChannel=testcasedata.getvalue("strChannel")
strProgramPID=testcasedata.getvalue("strProgramPID")
strCampaignName=testcasedata.getvalue("strCampaignName")

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
							wait 5
							.selectDate reportProgramSummary,"EndDate",END_DATE		
							wait 5
													
							REM .selectListItem MULTI_LIST_SITES,strSites,"True"
							REM wait 5
							
							REM .selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							REM wait 5
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							wait 5
								
							REM .webList("Grouping").selectItem strGrouping
							REM wait 3
							
							.webEdit("Comments").setValue strComments
							wait 5
							
							.webButton("Generate").press
		
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_PS").assertExist "True"
							wait 5	
							
                            .webLink("AdvancedSearch").press					
					        wait 3	
							
					        .webEdit("ProgramTitle").setValue strProgramTitle
							 wait 3
							 
							 webEdit("Channel").setValue strChannel
							 wait 3
							 
					        .selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							
							 wait 3
							 .selectListItem MULTI_LIST_CampaignName,strCampaignName,"True"
							
							 wait 3
					        .selectDate reportProgramSummary,"StartDate",START_DATE	
							 wait 3
					        .selectDate reportProgramSummary,"EndDate",END_DATE	
							 wait 3
							
					        .webLink("AdvSearch").press					
					         wait 5
							 
							.webTable("PreferredData_PS").searchData strProgramTitle	
							.webTable("PreferredData_PS").searchData strProgramPID	
							.webTable("PreferredData_PS").searchData strCampaignName	
							.webTable("PreferredData_PS").searchData Channel	

							strFromTo= "From " & START_DATE & " to " & END_DATE
					        .webTable("PreferredData_PS").searchData strFromTo
							
						   .webTable("SearchCriteria_PS").assertExist "True" 
						   .webTable("SearchCriteria_PS").assertStatus "Visible"
						   .webElement("SearchCriteria").assertStatus "Visible"
							webLink("Channel_PS").press
							webLink("CampaignName_PS").press
							
							.webTable("PreferredData_PS").searchData strProgramTitle	
							.webTable("PreferredData_PS").searchData strProgramPID	
							.webTable("PreferredData_PS").searchData strFromTo
							
							.webLink("Channel_PS").assertExist "False"
							.webLink("CampaignName_PS").assertExist "False"
							
					        .webLink("ClearAll_PS").press
					         wait 5
							 
					        .webLink("ClearAll_PS").assertExist "False"	
							
					        .webLink("BackToPreviousPage").press
						    wait 10			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
							 
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_PSR_TC_032"