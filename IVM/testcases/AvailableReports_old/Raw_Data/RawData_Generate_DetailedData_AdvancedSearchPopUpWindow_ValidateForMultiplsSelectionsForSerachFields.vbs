'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate the multipel search using advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RDR_TC_041"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

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
							.webEdit("ProgramPID").setValue strProgramPID
							wait 3
							.selectDate reportRawData,"StartDate",START_DATE

							.selectDate reportRawData,"EndDate",END_DATE
							wait 3
							.webLink("AdvSearch").press
							wait 5
					
'validate in table					
							.webTable("DetailedData_RD").searchData strElementNumber
							
							.webTable("DetailedData_RD").searchData strCampaignName
							
							.webTable("DetailedData_RD").searchData strClockNumber
							
							.webTable("DetailedData_RD").searchData strProgramPID
							
							strFromTo= "From " & START_DATE & " to " & END_DATE
					        .webTable("DetailedData_RD").searchData strFromTo
							
					        .webLink("ClearAll_RD").press
					         wait 5
							 
					        .webLink("ClearAll_RD").assertExist "False"					
					        			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RDR_TC_041"