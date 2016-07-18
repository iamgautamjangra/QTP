'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ScheduleOptions_SelectMonthlyFrequency_ValidateControls
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectMonthlyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testCaseData.getValue("ReportName")
strDy=testCaseData.getValue("strDy")
strDy1=testCaseData.getValue("strDy1")
strDyAll=testCaseData.getValue("strDyAll")
strScheduleDate=testCaseData.getValue("strScheduleDate")
strMnth=testCaseData.getValue("strMnth")
strYr=testCaseData.getValue("strYr")
strTime=testCaseData.getValue("strTime")

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
									
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									 wait 8
									 									 
									.webList("Frequency").selectItem "Repeat Monthly"
									
									.webElement("On").assertExist "True"
									.webElement("On").assertStatus "Visible"
									.webElement("EndDate").assertExist "True"
									.webElement("EndDate").assertStatus "Visible"
									.webEdit("DaysOfMonth").assertExist "True"
									.webEdit("DaysOfMonth").assertStatus "Visible"
									'.assertListItems MULTI_LIST_DAYSOFMONTH,""
									.webList("SelectAMonth").assertExist "True"
									.webList("SelectAMonth").assertStatus "Visible"
									.webList("SelectAMonth").assertListItems "SelectAMonth"
									.webList("SelectYear").assertExist "True"
									.webList("SelectYear").assertStatus "Visible"
									.webList("SelectYear").assertListItems "SelectYear"
									.webElement("DefaultReportGenerate").assertExist "True"
									.webElement("DefaultReportGenerate").assertStatus "Visible"
									.webElement("DefaultReportGenerateMonthly").assertText " This report will be generated monthly on days starting on dd-mm-yyyy at 00:00 until month year."
									
									.selectDate "ScheduleDate", strScheduleDate
									wait 2
									.selectListItem MULTI_LIST_DAYSOFMONTH,strDy,"True"
									wait 5
									.webList("SelectAMonth").selectItem strMnth
									wait 4
									.webList("SelectYear").selectItem strYr
									wait 2
									.webEdit("Time").setValue strTime
									.webImage("time").press
									.webButton("Done").press
																		
									.webElement("DefaultReportGenerateMonthly").assertText "This report will be generated monthly on "& strDy &"th starting on "& strScheduleDate &" at "&strTime&" until "&strMnth&" "& strYr &"."
									
							
							 
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDy1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_DAYSOFMONTH,strDy,"True"
							.validateSelectedListItem MULTI_LIST_DAYSOFMONTH,strDy1,"True"
							
							strDyAll=testcasedata.getvalue("strDyAll")
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"True"
							wait 2
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"False" '''all items selected function
							
							.webEdit("Provider").assertValue "Type to search..."
							strDyAll=testcasedata.getvalue("strDyAll")
							
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"True"
							wait 2
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"False" '''all items deselected function
							
							strDyAll=testcasedata.getvalue("strDyAll")
							strDy=testcasedata.getvalue("strDy")
							
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"True"
							 wait 2
							.selectListItem MULTI_LIST_DAYSOFMONTH,strDy,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_DAYSOFMONTH,strDyAll,"False" 	
									
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ScheduleOptions_SelectMonthlyFrequency_ValidateControls", "SCR_NEW_RDR_TC_001"

