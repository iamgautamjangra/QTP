'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDatesAndLastDate_GenerateReport
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   20-10-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDatesAndLastDate_GenerateReport", "SCR_NLS_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30


strReportName=testcasedata.getvalue("strReportName")
strNaturalLanguageFirstDate=testcasedata.getvalue("strNaturalLanguageFirstDate")
stri=testcasedata.getvalue("stri")
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
									
							.webList("LastDate").selectItem "Date"
						
							strInvLastDate = DateAdd("d",stri,Date())
						
							.selectDate "LastDate", strInvLastDate							 
							
					
							 
							         SCHEDULED_TIME2=getDate("Time","EDT",8)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
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
executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_InValidNaturalLanguageSelectionStartDatesAndLastDate_GenerateReport", "SCR_NLS_TC_005"
