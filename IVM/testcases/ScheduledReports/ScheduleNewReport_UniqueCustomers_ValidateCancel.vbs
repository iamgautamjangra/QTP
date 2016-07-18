'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_UniqueCustomers_ValidateCancel
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateCancel", "SCR_NEW_ASR_TC_008"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30

strFirstDate=FIRST_DATE
strLastDate=LAST_DATE
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
strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									  wait 15
									
									.webRadiogroup("ReportType").selectGroupItem reportUniqueCustomers
									 wait 8
											
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait 3
									 
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									 wait 3
									
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									 wait 3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait 3
									 
									 SCHEDULED_TIME=getDate("Time","EDT",4)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									.selectDate "EndDate", strEndDate
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Cancel").press
									
									 wait 15
									 
									
									.webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									
									'wait Wait300
									
								'	.assertFormrecord reportUniqueCustomers,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
			
End With
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateCancel", "SCR_NEW_ASR_TC_008"