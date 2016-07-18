'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the "Advertisement And Program Details "with invalid Start and End date.
' Author 						:   Fonantrix Solution
' Date 							:   17-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

 

'Start Test Case

 executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_InvalidStartAndEndDates_GenerateReport", "REP_APD_TC_014"



  StartDateValue=testcasedata.getvalue("StartDateValue")
  EndDateValue=testcasedata.getvalue("EndDateValue")
  ErrorStartDate=testcasedata.getvalue("ErrorStartDate")
  ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS

 

With ivm.page(report_page)

 
                            .webTable("AvailableReports").pressTblLink reportAdvertisementAndProgramDetails,3
                            wait 10
                            If StartDateValue <> "" then                                                                                        
                               .selectDate reportAdvertisementAndProgramDetails,"StartDate",StartDateValue
                            End if
							
                            If EndDateValue <> "" then
                                 .selectDate reportAdvertisementAndProgramDetails,"EndDate",EndDateValue                       
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

executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_InvalidStartAndEndDates_GenerateReport", "REP_APD_TC_014"