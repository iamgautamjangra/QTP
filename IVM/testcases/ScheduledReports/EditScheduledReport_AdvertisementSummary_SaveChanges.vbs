'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementSummary_SaveChanges
' Description					:	Validate the Save Changes operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_SaveChanges", "SCR_EDIT_ASR_TC_009"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strFirstDate=SDFIRST_DATE
strLastDate=SDLAST_DATE
strScheduleDate=testcasedata.getvalue("strScheduleDate")
strTime=testcasedata.getvalue("strTime")
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

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
									 wait Wait15
													
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,"All","True"
									.selectListItem MULTI_LIST_SITES,"All","False"
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait Wait3
									 
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"False"
									 wait Wait3
									
									.selectListItem MULTI_LIST_CAMPAIGN,"All","True"
									.selectListItem MULTI_LIST_CAMPAIGN,"All","False"
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
									 wait Wait3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait Wait3
									 SCHEDULED_TIME=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("SaveChanges").press
									
									  wait Wait15
									 
									
									.webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									wait Wait5
									TableValidation="Advertisement Summary" &";"& "Once on " &  SCHEDULED_DATE & ";"
									wait Wait300
									.webtable("ScheduledReports").selectRow TableValidation
									
									.assertFormrecord reportAdvertisementSummary,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
									
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_SaveChanges", "SCR_EDIT_ASR_TC_009"