'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_InvalidStartAndEndDates_GenerateReport
' Description					:	Validate the creation of "Campaign Summary" report with Blank or invalid Start and End date.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_003"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait3

strStartDate=testcasedata.getvalue("strStartDate")
strEndDate=testcasedata.getvalue("strEndDate")
ErrorStartDate=testcasedata.getvalue("ErrorStartDate")
ErrorEndDate=testcasedata.getvalue("ErrorEndDate")

with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait Wait10	
						
		                .selectDate reportRawData,"StartDate",strStartDate
			             wait Wait5
						.selectDate reportRawData,"EndDate",strEndDate								    
						 wait Wait5
																					
					    .webButton("Generate").press
						 wait Wait5
								
						.assertExistWE ErrorStartDate,"True"
						 wait Wait2
						.assertExistWE ErrorEndDate,"True"
						 wait Wait2

						.webButton("Cancel").press
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_InvalidStartAndEndDates_GenerateReport", "REP_CSR_TC_003"	