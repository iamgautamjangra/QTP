'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ScheduleOptions_SelectDailyFrequency_ValidateControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectDailyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testCaseData.getValue("ReportName")
strScheduleDate=testCaseData.getValue("strScheduleDate")
strEndDate=testCaseData.getValue("strEndDate")
strTime=testCaseData.getValue("strTime")

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
								
									.webRadiogroup("ReportType").selectGroupItem ReportName
									 wait 8
																		 
									.webList("Frequency").selectItem "Repeat Daily"
									
									.webElement("EndDate").assertExist "True"
									.webElement("EndDate").assertStatus "Visible"
									.webEdit("EndDate").assertExist "True"
									.webEdit("EndDate").assertStatus "Visible"
									.webEdit("EndDate").assertValue "dd-mm-yyyy"
									.webImage("EndDate").assertExist "True"
									.webImage("EndDate").assertStatus "Visible"
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									.webElement("DefaultReportGenerate").assertText "This report will be generated daily starting on dd-mm-yyyy at 00:00 until dd-mm-yyyy."
									
									.selectDate"ScheduleDate",strScheduleDate
									.webEdit("Time").setValue strTime
									.webImage("time").press
									wait 2
									.webButton("Done").press
									wait 2
									.selectDate"EndDate",strEndDate
									.webElement("DefaultReportGenerate").assertText "This report will be generated daily starting on "& strScheduleDate & " at " & strTime & " until " & strEndDate & "."
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectDailyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

