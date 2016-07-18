'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_CampaignSummary_Schedule
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"

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
									
									.webRadiogroup("ReportType").selectGroupItem reportCampaignSummary
									 wait Wait30
											
									.selectDate "FirstDate", strFirstDate
									
									wait Wait3
									
									.selectDate "LastDate", strLastDate
									wait Wait3
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait Wait3
									 
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									 wait Wait3
									
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									 wait Wait3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait Wait3
									 
									 SCHEDULED_TIME=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 strTime1=SCHEDULED_TIME
									 
									 strTime=strTime1
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									 
									
									.webList("Frequency").selectitem strFrequency
									
									wait Wait3
									
									.selectDate "EndDate", strEndDate
									 wait Wait2
									 
									
									.webEdit("Time").setValue strTime
									
																
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									wait Wait20
									  
								
									.webElement("ScheduledReports").assertStatus "Visible"
									wait Wait5
									strTableValidation="Campaign Summary" & ";" & "Every day at " & strTime & ";"
									
									strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy
									wait Wait300
									
									.webtable("ScheduledReports").selectRow strTableValidation
									
									.assertFormrecord reportCampaignSummary,SCHEDULED_DATE & strTime,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"