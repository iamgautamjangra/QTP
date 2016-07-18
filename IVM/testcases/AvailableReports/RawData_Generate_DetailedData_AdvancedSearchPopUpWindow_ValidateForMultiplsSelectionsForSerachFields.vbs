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
wait Wait10
 
with ivm.page(report_page)

					    .webTable("AvailableReports").presstblLink reportRawData,3
					     wait Wait10
					   
					    .selectDate reportRawData,"StartDate",START_DATE

						.selectDate reportRawData,"EndDate",END_DATE
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait Wait3	

						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait Wait5							
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
					
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
							wait Wait8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_RD").assertExist "True"
							wait Wait5	
							
                            .webLink("AdvancedSearch").press					
					        wait Wait3
					
							.webEdit("ElementNumber").setValue strElementNumber
							wait Wait3
							.selectListItem MULTI_LIST_CAMPAIGNNAME,strCampaignName,"True"
							wait Wait3
							.webEdit("ClockNumber").setValue strClockNumber
							wait Wait3
							.webEdit("ProgramPID").setValue strProgramPID
							wait Wait3
							.selectDate reportRawData,"StartDate",START_DATE

							.selectDate reportRawData,"EndDate",END_DATE
							wait Wait3
							.webLink("AdvSearch").press
							wait Wait5
					
'validate in table					
							.webTable("DetailedData_RD").searchData strElementNumber
							
							.webTable("DetailedData_RD").searchData strCampaignName
							
							.webTable("DetailedData_RD").searchData strClockNumber
							
							.webTable("DetailedData_RD").searchData strProgramPID
							
							strFromTo= "From " & START_DATE & " to " & END_DATE
					        .webTable("DetailedData_RD").searchData strFromTo
							
					        .webLink("ClearAll_RD").press
					         wait Wait5
							 
					        .webLink("ClearAll_RD").assertExist "False"					
					        			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait Wait5
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RDR_TC_041"