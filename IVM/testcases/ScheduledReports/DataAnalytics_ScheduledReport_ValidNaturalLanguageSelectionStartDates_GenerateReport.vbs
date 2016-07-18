'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionStartDates_GenerateReport
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   20-10-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionStartDates_GenerateReport", "SCR_NEW_CSR_TC_006"
 
REM ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
REM wait 15


strReportName=testcasedata.getvalue("strReportName")
strNaturalLanguageFirstDate=testcasedata.getvalue("strNaturalLanguageFirstDate")
strNaturalLanguageLastDate=testcasedata.getvalue("strNaturalLanguageLastDate")
strFrequency=testcasedata.getvalue("strFrequency")
strEmail=testcasedata.getvalue("strEmail")
strDataType=testcasedata.getvalue("strDataType")
strReportFormat=testcasedata.getvalue("strReportFormat")
strComments=testcasedata.getvalue("strComments")



 With ivm.page(ScheduledReports_Page)

							REM .webLink("ScheduleNewReport").press
							 REM wait 10
							
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
									 wait 3
									.webList("Frequency").selectitem strFrequency
									
									.webEdit("Time").setValue SCHEDULED_TIME
									 wait 5
									
									.webEdit("EmailRecipients").setvalue strEmail
								
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
																	
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									wait 20
									  
									.webElement("ScheduledReports").assertExist "True"
									.webElement("ScheduledReports").assertStatus "Visible"
																																				
									wait 300
									strDateTime=SCHEDULED_DATE & SCHEDULED_TIME						
									strDataSet=getDataSetName(strReportName,strDateTime)
									
End With

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink strReportName,3
						 wait 10
                        .webTable("DataSet").presstblRadioBtn strDataSet,1 
						wait 7						 
						.webButton("Generate").press
						wait 10			
							

End With

With ivm.page(preferredData_page)
						
						.weblink("PreferredData").press
						wait 4						
						'Function Required
End With
With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							'Function Required
													
End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionStartDates_GenerateReport", "SCR_NEW_CSR_TC_006"
