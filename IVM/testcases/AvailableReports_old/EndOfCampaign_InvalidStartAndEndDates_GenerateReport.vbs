'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the "End Of Campaign "with invalid Start and End date.
' Author 						:   SeaChange
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

 

'Start Test Case

 executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_InvalidStartAndEndDates_GenerateReport", "REP_EOC_TC_013"



StartDateValue=testcasedata.getvalue("StartDateValue")

EndDateValue=testcasedata.getvalue("EndDateValue")

ErrorStartDate=testcasedata.getvalue("ErrorStartDate")

ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

 

ivm.ClickToMenu MENU_AVAILABLE_REPORTS

 

With ivm.page(report_page)

 
                            .webTable("AvailableReports").pressTblLink reportEndOfCampaign,3
                            wait Wait10
                            If StartDateValue <> "" then                                                                                        
                               .selectDate reportEndOfCampaign,"StartDate",StartDateValue
                            End if
							
                            If EndDateValue <> "" then
                                 .selectDate reportEndOfCampaign,"EndDate",EndDateValue                       
                             End if
                            wait Wait5

                                                                                                                                                                                                                                                                                                                                                

                            .webButton("Generate").press

                            wait Wait5

                                                                                                                                

                            .assertExistWE ErrorStartDate,"True"

                             wait Wait2

                            .assertExistWE ErrorEndDate,"True"

                             wait Wait2

 

                            .webButton("Cancel").press

                           wait Wait5

End With

 
'End Test Case 

executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_InvalidStartAndEndDates_GenerateReport", "REP_EOC_TC_013"
