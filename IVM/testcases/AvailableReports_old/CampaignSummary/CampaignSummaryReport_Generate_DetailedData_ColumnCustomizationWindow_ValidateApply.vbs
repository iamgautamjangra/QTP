'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

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
						
						.webButton("Generate").press
							wait 8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							wait 5
							
							.webTable("DetailedData_CS").pressColumnCustomization
							wait 5
							
'for Displayed columns																					
					
							.selectCustomizeColumn "Clock Number","False"
							.selectCustomizeColumn "Unique Customers","False"	
							.selectCustomizeColumn "Advert Placements","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
						    .selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
						    .selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Advert Average Play Time","False"

							.webLink("CustomizeApply").press
							wait 15
							
							.webTable("DetailedData_CS").assertExist "True"
'Displayed columns							

							.webTable("DetailedDataHeader_CS").assertCustomizeColumnExist "Time Range","True"
							.webTable("DetailedDataHeader_CS").assertCustomizeColumnExist "Element Number","True"
							.webTable("DetailedDataHeader_CS").assertCustomizeColumnExist "Campaign Name","True"
							.webTable("DetailedDataHeader_CS").assertCustomizeColumnExist "Program PID","True"
							.webTable("DetailedDataHeader_CS").assertCustomizeColumnExist "Total Ad Views","True"						
							
					        .webLink("BackToPreviousPage").press
							wait 10			
End with

with ivm.page(report_page)

				            .webButton("Cancel").press
					         wait 5
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"