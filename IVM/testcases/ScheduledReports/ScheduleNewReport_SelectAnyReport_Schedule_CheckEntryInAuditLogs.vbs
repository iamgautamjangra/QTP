'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_CampaignSummary_Schedule
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"

ivm.ClickToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testcasedata.getvalue("ReportName")
strFirstDate=testcasedata.getvalue("strFirstDate")
strLastDate=testcasedata.getvalue("strLastDate")
strScheduleDate=testcasedata.getvalue("strScheduleDate")
strEndDate=testcasedata.getvalue("strEndDate")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")
strTableValidation=testcasedata.getvalue("strTableValidation")
strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									 wait 15
									 
									 .selectDate "FirstDate",strFirstDate
									 .selectDate "LastDate",strLastDate
											
									.selectDate "ScheduleDate",strScheduleDate
									
									.webList("Frequency").selectItem "Repeat Daily"
									
									.selectDate "EndDate",strEndDate
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									
									wait 7
									 
									.webElement("ScheduledReports").assertExist "True"
									.webElement("ScheduledReports").assertStatus "Visible"

End With
ivm.NavigateToMenu MENU_AUDIT_LOG

wait 10

With ivm.page(AuditLog_page)

								.webTable("AuditLog").assertAuditLogRecord strUser,strUserAction,strItemtype

End With
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"