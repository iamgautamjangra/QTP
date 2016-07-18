'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_VODAdDeliveryDataFeed_ValidateCancel
' Description					:	Validate the Cancel operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   02-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_VODAdDeliveryDataFeed_ValidateCancel", "SCR_EDIT_VOD_TC_006"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strFirstDate=FIRST_DATE
strEndDate=END_DATE
strLastDate=LAST_DATE
strTime=testcasedata.getvalue("strTime")
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")
'TableValidation="VodAdDelivery"&";"& "Once on 2013-07-01 at 07:35"
'strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

With ivm.page(ScheduledReports_Page)

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
									  wait Wait15
													
									.selectDate "FirstDate", strFirstDate
									wait Wait5
									.selectDate "LastDate", strLastDate
									 	wait Wait5
									  SCHEDULED_TIME=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",3)
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 
									
									.webList("Frequency").selectitem strFrequency
									
									wait Wait3
									
									.selectDate "EndDate", strEndDate
									 wait Wait2
									 
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
										wait Wait5
									.webEdit("StorageLocation").setvalue strStorageLocation
										wait Wait5
									.webList("ReportFormat").selectItem strReportFormat
										wait Wait5
									
									.webEdit("Comments").setvalue strComments
										wait Wait5
									.webButton("Cancel").press
									
									  wait Wait15
									  
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									
									'.webtable("ScheduledReports").selectRow TableValidation
									
									
									
									'wait Wait300
			
									'.assertFormrecord reportVODAdDeliveryDataFeed,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_VODAdDeliveryDataFeed_ValidateCancel", "SCR_EDIT_VOD_TC_006"