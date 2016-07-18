'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the "Campaign Summary "with invalid Start and End date.
' Author 						:   Fonantrix Solution
' Date 							:   17-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

 

'Start Test Case

 executionController.startTestCase_w_TestCaseNumber "CampaignSummary_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_011"



StartDateValue=testcasedata.getvalue("StartDateValue")

EndDateValue=testcasedata.getvalue("EndDateValue")

ErrorStartDate=testcasedata.getvalue("ErrorStartDate")

ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

 

ivm.ClickToMenu MENU_AVAILABLE_REPORTS

 

With ivm.page(report_page)

 
                            .webTable("AvailableReports").pressTblLink reportCampaignSummary,3
                            wait 10
                            If StartDateValue <> "" then                                                                                        
                               .selectDate reportCampaignSummary,"StartDate",StartDateValue
                            End if
							
                            If EndDateValue <> "" then
                                 .selectDate reportCampaignSummary,"EndDate",EndDateValue                       
                             End if
                            wait 5

                                                                                                                                                                                                                                                                                                                                                

                            .webButton("Generate").press

                            wait 5

                                                                                                                                

                            .assertExistWE ErrorStartDate,"True"

                             wait 2

                            .assertExistWE ErrorEndDate,"True"

                             wait 2

 

                            .webButton("Cancel").press

                           wait 5

End With

 
'End Test Case 

executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_011"