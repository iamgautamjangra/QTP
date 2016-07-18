'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_Schedule
' Description					:	Validate the Schedule operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_Schedule", "SCR_NEW_EOC_TC_009"

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


With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait 10
									
									.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
							        wait 8
													
									.selectDate "FirstDate", strFirstDate
									
									wait 3
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
																 
									'.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									.webList("Campaign").selectItem strCampaign									
									'.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
																	 
									.webList("GroupBy").selectItem strGroupBy
									 wait 3
									  SCHEDULED_TIME2=getDate("Time","EDT",5)
									  SCHEDULED_DATE=getDate("Date","EDT",0)
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									
									.webList("Frequency").selectitem strFrequency
									
									wait 3
									
									.selectDate "EndDate", strEndDate
									 wait 2
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
								
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									
									wait 10
									 
									.webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
								
									strTableValidation="End of Campaign" & ";" & "Every day at " & SCHEDULED_TIME & ";"
                                     strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

									
									
									.webtable("ScheduledReports").selectRow strTableValidation
								
									wait Wait300	    
									.assertFormrecord reportEndOfCampaign,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
									'.assertFormrecord reportEndofCampaign,SCHEDULED_DATE & "08:04",strUiVal,"True"
									
									
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_Schedule", "SCR_NEW_EOC_TC_009"