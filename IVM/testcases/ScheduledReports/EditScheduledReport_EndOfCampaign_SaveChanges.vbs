'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_EndOfCampaign_SaveChanges
' Description					:	Validate the Save Changes operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_SaveChanges", "SCR_EDIT_EOC_TC_008"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testcasedata.getvalue("SearchVal")
TableValidation=testcasedata.getvalue("TableValidation")
strFirstDate=FIRST_DATE
strLastDate=LAST_DATE
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



With ivm.page(ScheduledReports_Page)
                                     .webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
									wait 10
									
													
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,"All","True"
									.selectListItem MULTI_LIST_SITES,"All","False"
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait 3
									 
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"False"
									 wait 3
									.webList("Campaign").selectItem strCampaign
									 wait 3
									 
									.webList("GroupBy").selectItem strGroupBy
									 wait 3
									 SCHEDULED_TIME2=getDate("Time","EDT",5)
									  SCHEDULED_DATE=getDate("Date","EDT",0)
									 
									 SCHEDULED_TIME1=SCHEDULED_TIME2
									 SCHEDULED_TIME=SCHEDULED_TIME1
									 
									.webList("Frequency").selectitem strFrequency
									wait Wait2
									.selectDate "ScheduleDate", SCHEDULED_DATE
									wait Wait2
									.webEdit("Time").setvalue SCHEDULED_TIME
									 wait Wait5
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("SaveChanges").press
									
									 wait Wait20
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									
									strTableValidation="End of Campaign" & ";" & "Every day at " & SCHEDULED_TIME & ";"
                                   strUiVal=strFirstDate &","& strLastDate &","& strCampaign &","& strProvider &","& strSites &","& strGroupBy
									
									.webtable("ScheduledReports").selectRow strTableValidation
									wait Wait300
									.assertFormrecord reportEndOfCampaign,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"True"
			
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_SaveChanges", "SCR_EDIT_EOC_TC_008"