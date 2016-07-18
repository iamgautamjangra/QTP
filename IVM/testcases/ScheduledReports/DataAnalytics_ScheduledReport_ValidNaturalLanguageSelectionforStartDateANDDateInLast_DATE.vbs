'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionforStartDateANDDateInLast_DATE
' Description					:	Validate the "Scheduled Reports "with valid Natural Language Selection Start and select date in End date.
' Author 						:   SeaChange
' Date 							:   18-11-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionforStartDateANDDateInLast_DATE", "SCR_NLS_TC_003"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strReportName=testcasedata.getvalue("strReportName")
strNaturalLanguageFirstDate=testcasedata.getvalue("strNaturalLanguageFirstDate")
strFrequency=testcasedata.getvalue("strFrequency")
strEmail=testcasedata.getvalue("strEmail")
strDataType=testcasedata.getvalue("strDataType")
strReportFormat=testcasedata.getvalue("strReportFormat")
strComments=testcasedata.getvalue("strComments")



 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait 10
							
							.webRadiogroup("ReportType").selectGroupItem strReportName
							 wait 8		
							
							.webList("FirstDate").assertExist "True"
							.webList("FirstDate").assertStatus "Visible"
									
							.webList("FirstDate").selectItem "Natural Language Selection"
							 wait 3
							 
                            .webEdit("NaturalLanguageFirstDate").assertExist "True"
							.webEdit("NaturalLanguageFirstDate").assertStatus "Visible"
							
							.webEdit("NaturalLanguageFirstDate").setValue strNaturalLanguageFirstDate
									 wait 5
							 
							 
							.webList("LastDate").assertExist "True"
							.webList("LastDate").assertStatus "Visible"
									
							.webList("LastDate").selectItem "Date"
							wait 2
							.webEdit("LastDate").assertExist "True"
							.webEdit("LastDate").assertStatus "Visible"
							 wait 3
							 LAST_DATE=getDate("Date","EDT",0)
							  .selectDate "LastDate", LAST_DATE
									 wait 3
							 
							         SCHEDULED_TIME2=getDate("Time","EDT",8)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
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
																																				
									'wait 300
									
									
									strDataSet=getDataSetName (strReportName,SCHEDULED_DATE & SCHEDULED_TIME)
									
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
						
End With
With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
													
End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "DataAnalytics_ScheduledReport_ValidNaturalLanguageSelectionforStartDateANDDateInLast_DATE", "SCR_NLS_TC_003"
