'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_RawData_ValidateCancel
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_RawData_ValidateCancel", "SCR_NEW_RDR_TC_008"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strFirstDate=FIRST_DATE
strLastDate=LAST_DATE
strEndDate=END_DATE
strSites=testcasedata.getvalue("strSites")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strFrequency=testcasedata.getvalue("strFrequency")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strEmail=testcasedata.getvalue("strEmail")
strComments=testcasedata.getvalue("strComments")
strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites


With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									  wait Wait15
									
								   .webRadiogroup("ReportType").selectGroupItem reportRawData
							        wait Wait8
													
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									 .webRadiogroup("Site_SiteGroup").selectGroupItem "Sites"
									
									wait Wait2
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
								
									 
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
								
									
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							
									 
								     SCHEDULED_TIME=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									.selectDate "EndDate", strEndDate
									.webEdit("Time").setvalue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Cancel").press
									
									 wait Wait15
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									

									.webTable("ScheduledReports").assertExist "True"
									
									
									REM wait Wait300
									
									REM .assertFormrecord reportRawData,SCHEDULED_DATE,strUiVal,"False"
									
									REM .assertFormrecord reportRawData,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
									
									
									
									
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_RawData_ValidateCancel", "SCR_NEW_RDR_TC_008"