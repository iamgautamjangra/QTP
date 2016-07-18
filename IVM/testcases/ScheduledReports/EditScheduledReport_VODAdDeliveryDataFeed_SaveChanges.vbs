'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_VODAdDeliveryDataFeed_SaveChanges
' Description					:	Validate the Shedule operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   02-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_VODAdDeliveryDataFeed_SaveChanges", "SCR_EDIT_VOD_TC_007"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strFirstDate=SDFIRST_DATE
strLastDate=SDLAST_DATE
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")

strUiVal=strFirstDate &","& strLastDate


With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
									 wait Wait15
													
									.selectDate "FirstDate", strFirstDate
										wait Wait2
									.selectDate "LastDate", strLastDate
										wait Wait2
															 
									  SCHEDULED_TIME2=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 
									
									.webList("Frequency").selectitem strFrequency
									
									wait Wait3
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
										wait Wait2
									.webEdit("StorageLocation").setvalue strStorageLocation
										wait Wait2
									.webList("ReportFormat").selectItem strReportFormat
							
										wait Wait2						
									
									.webEdit("Comments").setvalue strComments
									wait Wait5
									.webButton("SaveChanges").press
									
									  wait Wait15
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									
									strTableValidation="VOD Ad Delivery Data Feed"&";"&"Once on "& SCHEDULED_DATE & ";"
									.webtable("ScheduledReports").selectRow strTableValidation
									
									wait Wait300
									
									.assertFormrecord reportVODAdDelivery,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_VODAdDeliveryDataFeed_SaveChanges", "SCR_EDIT_VOD_TC_007"