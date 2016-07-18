'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the creation of "VOD Ad Delivery Data Feed" page with invalid Start and End date.
' Author 						:   Fonantrix Solution
' Date 							:   10-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_InvalidStartAndEndDates_GenerateReport", "REP_VOD_TC_004"
 
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

strStartDate=testcasedata.getvalue("strStartDate")
strEndDate=testcasedata.getvalue("strEndDate")
ErrorStartDate=testcasedata.getvalue("ErrorStartDate")
ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait 10	
						
		                .selectDate reportVODAdDeliveryDataFeed,"StartDate",strStartDate
			             wait 5
						.selectDate reportVODAdDeliveryDataFeed,"EndDate",strEndDate								    
						 wait 5
																					
					    .webButton("Generate").press
						 wait 5
								
						.assertExistWE ErrorStartDate,"True"
						 wait 2
						.assertExistWE ErrorEndDate,"True"
						 wait 2

						.webButton("Cancel").press
                
End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_InvalidStartAndEndDates_GenerateReport", "REP_VOD_TC_004"
