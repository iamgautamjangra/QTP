'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_UniqueCustomers_SaveChanges
' Description					:	Validate the Save Changes operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_UniqueCustomers_SaveChanges", "SCR_EDIT_ASR_TC_009"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30

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

									.webTable("ScheduledReports").pressLink  SearchVal,"Edit Options",6
									 wait 15
									 .webList("FirstDate").selectItem "Date"
							       wait Wait3
							        .webList("LastDate").selectItem "Date"
							       wait Wait3				
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,"All","True"
									.selectListItem MULTI_LIST_SITES,"All","False"
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait 3
									 
									REM .selectListItem MULTI_LIST_PROVIDER,"All","True"
									REM .selectListItem MULTI_LIST_PROVIDER,"All","False"
									REM .selectListItem MULTI_LIST_PROVIDER,strProvider,"False"
									 REM wait 3
									
									.selectListItem MULTI_LIST_CAMPAIGN,"All","True"
									.selectListItem MULTI_LIST_CAMPAIGN,"All","False"
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
									 wait 3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait 3
									 SCHEDULED_TIME2=getDate("Time","EDT",5)
									 SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									.webEdit("Time").setValue SCHEDULED_TIME
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("SaveChanges").press
									
									  wait 15
									 
								
									.webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									wait Wait5
									TableValidation="Unique Customers" &";"& "Once on " &  SCHEDULED_DATE & ";"
									.webtable("ScheduledReports").selectRow TableValidation
									wait Wait300
									.assertFormrecord reportUniqueCustomers,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_UniqueCustomers_SaveChanges", "SCR_EDIT_ASR_TC_009"