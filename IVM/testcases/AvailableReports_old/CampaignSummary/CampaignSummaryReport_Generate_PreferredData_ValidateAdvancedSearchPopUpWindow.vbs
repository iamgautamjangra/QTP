'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_017"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
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
							
							.webLink("AdvancedSearch").press
							wait 3
							
							.webElement("SearchTerm").assertExist "True"
							.webElement("SearchTerm").assertStatus "Visible"
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webElement("ElementNumber").assertExist "True"
							.webElement("ElementNumber").assertStatus "Visible"
							.webEdit("ElementNumber").assertExist "True"
							.webEdit("ElementNumber").assertStatus "Visible"
							
							.webElement("CampaignName").assertExist "True"
							.webElement("CampaignName").assertStatus "Visible"
							.webEdit("CampaignName").assertExist "True"
							.webEdit("CampaignName").assertStatus "Visible"
							
							.webElement("ProgramPID").assertExist "True"
							.webElement("ProgramPID").assertStatus "Visible"
							.webEdit("ProgramPID").assertExist "True"
							.webEdit("ProgramPID").assertStatus "Visible"
							
							
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
														
							.webElement("Between").assertExist "True"
							.webElement("Between").assertStatus "Visible"
							.webEdit("Between").assertExist "True"
							.webEdit("Between").assertStatus "Visible"
							.webImage("Between").assertExist "True"
							.webImage("Between").assertStatus "Visible"
							
							.webElement("And").assertExist "True"
							.webElement("And").assertStatus "Visible"
							.webEdit("And").assertExist "True"
							.webEdit("And").assertStatus "Visible"
							.webImage("And").assertExist "True"
							.webImage("And").assertStatus "Visible"
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webButton("AdvCancel").assertExist "True"
							.webButton("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							wait 5
							
                            .webLink("BackToPreviousPage").assertExist "True"
						    .webLink("BackToPreviousPage").assertStatus "Visible"							
						    .weblink("BackToPreviousPage").press
						    wait 10
							
End With

With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait 10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_017"