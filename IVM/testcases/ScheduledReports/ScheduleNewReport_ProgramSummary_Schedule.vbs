'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ProgramSummary_Schedule
' Description					:	Validate the Schedule operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_Schedule", "SCR_NEW_PSR_TC_009"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strFirstDate=SDFIRST_DATE
strLastDate=SDLAST_DATE
strEndDate=END_DATE
strSites=testcasedata.getvalue("strSites")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strGroupBy=testcasedata.getvalue("strGroupBy")
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")



With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									  wait Wait15
									
									.webRadiogroup("ReportType").selectGroupItem reportProgramSummary
									 wait Wait15
											
									.selectDate "FirstDate", strFirstDate
									
																
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									
									
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									
									 
									.webList("GroupBy").selectItem strGroupBy
								
									 
									 SCHEDULED_TIME2=getDate("Time","EDT",4)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 
									
									.webList("Frequency").selectitem strFrequency
									
								
									
									.selectDate "EndDate", strEndDate
									
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									
									 wait Wait15
									
									.webElement("ScheduledReports").assertStatus "Visible"
									 
									.webElement("ScheduledReports").assertExist "True"
									
									strTableValidation="Program Summary" & ";" & "Every day at " & SCHEDULED_TIME & ";"
									
									
									strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy
									wait Wait300
									
									.webtable("ScheduledReports").selectRow strTableValidation
								.assertFormrecord reportProgramSummary,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_Schedule", "SCR_NEW_PSR_TC_009"