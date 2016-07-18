'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_VODAdDeliveryDataFeed_Schedule
' Description					:	Validate the Shedule operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   02-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_VODAdDeliveryDataFeed_Schedule", "SCR_NEW_VOD_TC_007"


ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strFirstDate=SDFIRST_DATE
strLastDate=SDLAST_DATE
strEndDate=END_DATE
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")

strUiVal=strFirstDate &","& strLastDate

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportVODAdDeliveryDataFeed
									 wait Wait8
											
									.selectDate "FirstDate", strFirstDate
									wait Wait2
									.selectDate "LastDate", strLastDate
								    wait Wait2
									
									 SCHEDULED_TIME2=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
										wait Wait2
									.webList("Frequency").selectitem strFrequency
										wait Wait2
									.selectDate "EndDate", strEndDate
										wait Wait2
									.webEdit("Time").setValue SCHEDULED_TIME
									 wait Wait5
									
									.webEdit("EmailRecipients").setvalue strEmail
									wait Wait2
									.webEdit("StorageLocation").setvalue strStorageLocation
									wait Wait2
									.webList("ReportFormat").selectItem strReportFormat
							        wait Wait2
									
									.webEdit("Comments").setvalue strComments
									wait Wait2
									.webButton("Schedule").press
									
									wait Wait25
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									wait Wait70
									strTableValidation="VOD Ad Delivery Data Feed"&";"&"Every day at " & SCHEDULED_TIME & ";"
									
									
									wait Wait300
									.webtable("ScheduledReports").selectRow strTableValidation
									
									.assertFormrecord reportVODAdDelivery,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
			
End With
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_VODAdDeliveryDataFeed_Schedule", "SCR_NEW_VOD_TC_007"