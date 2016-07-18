'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ScheduleOptions_SelectWeeklyFrequency_ValidateControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectWeeklyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

REM ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
REM wait 15

ReportName=testCaseData.getValue("ReportName")
strDy=testCaseData.getValue("strDy")
strDy1=testCaseData.getValue("strDy1")
strDyAll=testCaseData.getValue("strDyAll")
strScheduleDate=testCaseData.getValue("strScheduleDate")
strEndDate=testCaseData.getValue("strEndDate")
strTime=testCaseData.getValue("strTime")

with ivm.page(ScheduledReports_Page)
			
				
									REM .webLink("ScheduleNewReport").press
									 REM wait 10
									
									
									REM .webRadiogroup("ReportType").selectGroupItem ReportName
									 REM wait 8
									 
									.webList("Frequency").selectItem "Repeat Weekly"
									
									
									.webElement("On").assertExist "True"
									.webElement("On").assertStatus "Visible"
									.webEdit("DaysOfWeek").assertExist "True"
									.webEdit("DaysOfWeek").assertStatus "Visible"
									'.assertListItems MULTI_LIST_DAYSOFWEEK,""
									.webElement("EndDate").assertExist "True"
									.webElement("EndDate").assertStatus "Visible"
									.webEdit("EndDate").assertExist "True"
									.webEdit("EndDate").assertStatus "Visible"
									.webEdit("EndDate").assertValue "dd-mm-yyyy"
									.webImage("EndDate").assertExist "True"
									.webImage("EndDate").assertStatus "Visible"
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									.webElement("DefaultReportGenerateWeekly").assertText "This report will be generated weekly on days starting on dd-mm-yyyy at 00:00 until dd-mm-yyyy."
									
									.selectDate "ScheduleDate",strScheduleDate
									.selectDate "EndDate",strEndDate
									wait 1
									.selectListItem MULTI_LIST_DAYSOFWEEK,strDy,"True"
									wait 1
									.webEdit("Time").setValue strTime
									.webImage("time").press
									.webButton("Done").press
									wait 1
									.webElement("DefaultReportGenerateWeekly").assertText "This report will be generated weekly on "&strDy&" starting on " &strScheduleDate&" at "&strTime&" until "&strEndDate&"."
									wait 2
							 
							.selectListItem MULTI_LIST_DAYSOFWEEK,strDy1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_DAYSOFWEEK,strDy,"True"
							.validateSelectedListItem MULTI_LIST_DAYSOFWEEK,strDy1,"True"
							
							strDyAll=testcasedata.getvalue("strDyAll")
							
							.selectListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"False" '''all items selected function
							
							.webEdit("Provider").assertValue "Type to search..."
							strDyAll=testcasedata.getvalue("strDyAll")
							.selectListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"False" '''all items deselected function
							
							strDyAll=testcasedata.getvalue("strDyAll")
							strDy=testcasedata.getvalue("strDy")
							
							.selectListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"True"
							 wait 2
							.selectListItem MULTI_LIST_DAYSOFWEEK,strDy,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFWEEK,strDyAll,"False" 	
									
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectWeeklyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

