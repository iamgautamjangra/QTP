'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_CSR_TC_050"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")

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
						
						.webButton("Generate").press
							wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
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
							.selectDate reportCampaignSummary,"StartDate",START_DATE

							.selectDate reportCampaignSummary,"EndDate",END_DATE
							wait 3
							.webLink("AdvSearch").press
							wait 5
					
'validate in table					
							.webTable("DetailedData_CS").assertTableData 'TBD strElementNumber
							
							.webTable("DetailedData_CS").assertTableData 'TBD strCampaignName
							
							.webTable("DetailedData_CS").assertTableData 'TBD strClockNumber
							
							.webTable("DetailedData_CS").assertTableData 'TBD strProgramPID
							
							strFromTo= "From " & START_DATE & " to " & END_DATE
					        .webTable("DetailedData_CS").assertTableData 'TBD strFromTo
							
					        .webLink("ClearAll_CS").press
					         wait 5
							 
					        .webLink("ClearAll_CS").assertExist "False"		
							
							.webLink("BackToPreviousPage").press
						    wait 10
					        			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
End with					
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_CSR_TC_050"