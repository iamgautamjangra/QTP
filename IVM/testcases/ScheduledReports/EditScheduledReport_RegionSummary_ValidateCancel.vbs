'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_RegionSummary_ValidateCancel
' Description					:	Validate the Cancel operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_RegionSummary_ValidateCancel", "SCR_EDIT_RSR_TC_008"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strFirstDate=FIRST_DATE
strLastDate=LAST_DATE
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

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options","6"
									 wait Wait15
													
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,"All","True"
									.selectListItem MULTI_LIST_SITES,"All","False"
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									
									 
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									
									
									.selectListItem MULTI_LIST_CAMPAIGN,"All","True"
									.selectListItem MULTI_LIST_CAMPAIGN,"All","False"
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									
									 
									.webList("GroupBy").selectItem strGroupBy
								
									 SCHEDULED_TIME=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",3)
									 
									 strTime1=SCHEDULED_TIME
									 strTime=strTime1
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									.webEdit("Time").setValue strTime
									
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Cancel").press
									
									  wait Wait15
									 
									
									.webElement("ScheduledReports").assertStatus "Visible"
									
									'.webtable("ScheduledReports").selectRow TableValidation
			                        'wait Wait300
									
									'.assertFormrecord reportRegionSummary,SCHEDULED_DATE,strUiVal,"False"
									'.assertFormrecord reportRegionSummary,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_RegionSummary_ValidateCancel", "SCR_EDIT_RSR_TC_008"