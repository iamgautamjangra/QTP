'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the "Advertisement Summary "with invalid Start and End date.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

 

'Start Test Case

 executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_InvalidStartAndEndDates_GenerateReport", "REP_ASR_TC_014"



StartDateValue=testcasedata.getvalue("StartDateValue")

EndDateValue=testcasedata.getvalue("EndDateValue")

ErrorStartDate=testcasedata.getvalue("ErrorStartDate")

ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

 

ivm.ClickToMenu MENU_AVAILABLE_REPORTS

 

With ivm.page(report_page)

 
                            .webTable("AvailableReports").pressTblLink reportAdvertisementSummary,3
                            wait 10
							
						   .webTable("SelectaDatasetforThisReport").assertExist "True"
						   .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                           .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						   .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							 			
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
							REM .webElement("FilterOptions").press
							REM wait 5
		
		
                            If StartDateValue <> "" then                                                                                        
                               .selectDate reportAdvertisementSummary,"StartDate",StartDateValue
                            End if
							
                            If EndDateValue <> "" then
                                 .selectDate reportAdvertisementSummary,"EndDate",EndDateValue                       
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

executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_InvalidStartAndEndDates_GenerateReport", "REP_ASR_TC_014"