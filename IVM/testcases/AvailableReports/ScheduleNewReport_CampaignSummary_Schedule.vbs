'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ScheduleNewReport_CampaignSummary_Schedule
' Description					:	Validate the Cancel operation on Schedule a new report page.
' Author 						:   Fonantrix Solution
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"

'ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
'wait 15

strFirstDate=testcasedata.getvalue("strFirstDate")
strLastDate=testcasedata.getvalue("strLastDate")
strScheduleDate=testcasedata.getvalue("strScheduleDate")
strTime=testcasedata.getvalue("strTime")
strEndDate=testcasedata.getvalue("strEndDate")
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
strTableValidation=testcasedata.getvalue("strTableValidation")
strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy

With ivm.page(ScheduledReports_Page)

									.webLink("ScheduleNewReport").press
									 wait Wait10
									
									.webRadiogroup("ReportType").selectGroupItem reportCampaignSummary
									 wait 15
											
									.selectDate "FirstDate", strFirstDate
									
									wait Wait3
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait Wait3
									 
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									 wait Wait3
									
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									 wait Wait3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait Wait3
									 
									 .webRadiogroup("GenerateOption").selectGroupItem "generateOnSchedule"
									 
									 wait Wait5
									 
									 .selectDate "ScheduleDate", strScheduleDate
									 
									
									.webList("Frequency").selectitem strFrequency
									
									wait Wait3
									
									.selectDate "EndDate", strEndDate
									 wait Wait2
									
									.webEdit("Time").setValue strTime
									
									'.TimeSchedule "10","AM"
									 'wait Wait5
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Schedule").press
									
									wait 15
									 
									.webElement("ScheduledReports").assertExist "True"
									.webElement("ScheduledReports").assertStatus "Visible"
									
									
									.webtable("ScheduledReports").selectRow strTableValidation
									
									wait Wait300
									
									.assertFormrecord reportCampaignSummary,strScheduleDate & strTime,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_Schedule", "SCR_NEW_CSR_TC_008"