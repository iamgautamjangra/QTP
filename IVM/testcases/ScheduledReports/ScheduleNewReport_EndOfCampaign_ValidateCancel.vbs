'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_ValidateCancel
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateCancel", "SCR_NEW_EOC_TC_008"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

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
									 wait 10
									
								   .webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
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
									  SCHEDULED_TIME2=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 wait 3
									
									.webList("Frequency").selectitem strFrequency
									
									.selectDate "EndDate", strEndDate
									.webEdit("Time").setvalue SCHEDULED_TIME
									wait 3
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Cancel").press
									
									wait 10
									 
									.webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									

									.webTable("ScheduledReports").assertExist "True"
									
									
									'wait Wait300
									
									'.assertFormrecord reportEndofCampaign,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
									
									
									
									
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateCancel", "SCR_NEW_EOC_TC_008"