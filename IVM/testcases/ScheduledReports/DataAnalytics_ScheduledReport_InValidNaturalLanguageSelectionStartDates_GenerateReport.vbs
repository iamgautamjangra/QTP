'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDates_GenerateReport
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   20-10-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDates_GenerateReport", "SCR_NEW_CSR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 20


strReportName=testcasedata.getvalue("strReportName")
strNaturalLanguageFirstDate=testcasedata.getvalue("strNaturalLanguageFirstDate")
strNaturalLanguageLastDate=testcasedata.getvalue("strNaturalLanguageLastDate")
strFrequency=testcasedata.getvalue("strFrequency")
strEmail=testcasedata.getvalue("strEmail")
strDataType=testcasedata.getvalue("strDataType")
strReportFormat=testcasedata.getvalue("strReportFormat")
strComments=testcasedata.getvalue("strComments")
strFirstDateErrorText=testcasedata.getvalue("strFirstDateErrorText")
strLastDateErrorText=testcasedata.getvalue("strLastDateErrorText")



 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait 10
							
							.webRadiogroup("ReportType").selectGroupItem strReportName
							 wait 8		
							
							.webList("FirstDate").assertExist "True"
							.webList("FirstDate").assertStatus "Visible"
									
							.webList("FirstDate").selectItem "Natural Language Selection"
						
							 
                            .webEdit("NaturalLanguageFirstDate").assertExist "True"
							.webEdit("NaturalLanguageFirstDate").assertStatus "Visible"
							
							.webEdit("NaturalLanguageFirstDate").setValue strNaturalLanguageFirstDate
							
							 
							 
							.webList("LastDate").assertExist "True"
							.webList("LastDate").assertStatus "Visible"
									
							.webList("LastDate").selectItem "Natural Language Selection"
							
							.webEdit("NaturalLanguageLastDate").assertExist "True"
							.webEdit("NaturalLanguageLastDate").assertStatus "Visible"
							 
							 
							 .webEdit("NaturalLanguageLastDate").setValue strNaturalLanguageLastDate
							
							 
							         SCHEDULED_TIME=getDate("Time","EDT",8)
									 SCHEDULED_DATE=getDate("Date","EDT",8)
									 .selectDate "ScheduleDate", SCHEDULED_DATE
								
									.webList("Frequency").selectitem strFrequency
									
									.webEdit("Time").setValue SCHEDULED_TIME
								
									
									.webEdit("EmailRecipients").setvalue strEmail
								
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
																	
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									wait Wait5
									
								   .assertExistWe strFirstDateErrorText,"True"
									wait Wait2
									.assertExistWe strLastDateErrorText,"True"
									wait Wait2
									
									
									
End With


'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDates_GenerateReport", "SCR_NEW_CSR_TC_006"
