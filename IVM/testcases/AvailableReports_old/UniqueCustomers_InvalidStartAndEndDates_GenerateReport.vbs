'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the "Unique Customers "with invalid Start and End date.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

 

'Start Test Case

 executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_InvalidStartAndEndDates_GenerateReport", "REP_UCR_TC_014"



StartDateValue=testcasedata.getvalue("StartDateValue")

EndDateValue=testcasedata.getvalue("EndDateValue")

ErrorStartDate=testcasedata.getvalue("ErrorStartDate")

ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

 

ivm.ClickToMenu MENU_AVAILABLE_REPORTS

 

With ivm.page(report_page)

 
                            .webTable("AvailableReports").pressTblLink reportUniqueCustomers,3
                            wait Wait10
							
						   .webTable("SelectaDatasetforThisReport").assertExist "True"
						   .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						   .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                           .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						   .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait Wait5
							 			
							.webLink("FilterOptions").assertExist "True"
						    .webLink("FilterOptions").assertStatus "Visible"
							REM .webLink("FilterOptions").press
							REM wait Wait5
		
		
                            If StartDateValue <> "" then                                                                                        
                               .selectDate reportUniqueCustomers,"StartDate",StartDateValue
                            End if
							
                            If EndDateValue <> "" then
                                 .selectDate reportUniqueCustomers,"EndDate",EndDateValue                       
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

executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_InvalidStartAndEndDates_GenerateReport", "REP_UCR_TC_014"