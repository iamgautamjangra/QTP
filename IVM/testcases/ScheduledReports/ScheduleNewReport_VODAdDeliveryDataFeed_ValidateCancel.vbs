'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_VODAdDeliveryDataFeed_ValidateCancel
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   012-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_VODAdDeliveryDataFeed_ValidateCancel", "SCR_NEW_VOD_TC_006"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strFirstDate=testcasedata.getvalue("strFirstDate")
strLastDate=testcasedata.getvalue("strLastDate")
strEndDate=testcasedata.getvalue("strEndDate")

strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")

strUiVal=strFirstDate & "," & strLastDate






With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportVODAdDeliveryDataFeed
									 wait Wait8
									 
									 .selectDate "FirstDate", strFirstDate
									wait Wait3
									.selectDate "LastDate", strLastDate
									wait Wait3
									.webRadiogroup("GenerateOption").selectGroupItem "generateOnSchedule"
									 wait Wait8
									
									SCHEDULED_TIME=getDate("Time","EDT",5)
									SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									wait Wait2
									.webList("Frequency").selectitem strFrequency
									wait Wait2
									.selectDate "EndDate", strEndDate
										wait Wait3
										
									.webEdit("Time").setValue SCHEDULED_TIME	
									.webEdit("EmailRecipients").setvalue strEmail
										wait Wait3
									.webEdit("StorageLocation").setvalue strStorageLocation
										wait Wait3
									.webList("ReportFormat").selectItem strReportFormat
								     wait Wait3
								
									.webEdit("Comments").assertExist "True"
									wait Wait2
									.webEdit("Comments").setvalue strComments
										wait Wait3
									.webButton("Cancel").press
									
									wait Wait10
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
								
									
									'.webtable("ScheduledReports").selectRow TableValidation
			                        'wait Wait300
									
									'.assertFormrecord reportCampaignSummary,SCHEDULED_DATE,strUiVal,"False"
									'.assertFormrecord reportCampaignSummary,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
									
									
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_VODAdDeliveryDataFeed_ValidateCancel", "SCR_NEW_VOD_TC_006"