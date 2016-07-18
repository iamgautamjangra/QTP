'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_RawData_ValidateCancel
' Description					:	Validate the Cancel operation on edit the Schedule report.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------



executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_RawData_ValidateCancel", "SCR_EDIT_RDR_TC_007"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
TableValidation=testcasedata.getvalue("TableValidation")
strFirstDate=FIRST_DATE
strLastDate=LAST_DATE
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

									.webTable("ScheduledReports").pressLink SearchVal,"Edit Options","6"
									 wait Wait15
													
									.selectDate "FirstDate", strFirstDate
									
									.selectDate "LastDate", strLastDate
									
									.selectListItem MULTI_LIST_SITES,"All","True"
									.selectListItem MULTI_LIST_SITES,"All","False"
									
									.selectListItem MULTI_LIST_SITES,strSites,"True"
									 wait Wait2
									 
									.selectListItem MULTI_LIST_PROVIDER,"All","True"
									.selectListItem MULTI_LIST_PROVIDER,"All","False"
									.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
									 wait Wait2
									
									.selectListItem MULTI_LIST_CAMPAIGN,"All","True"
									.selectListItem MULTI_LIST_CAMPAIGN,"All","False"
									.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
									 wait Wait3
									 
																		 
									 .selectDate "ScheduleDate", SCHEDULED_DATE
									
									.webList("Frequency").selectitem strFrequency
									
									'.TimeSchedule "10","AM"
									 'wait Wait5
									
									.webEdit("EmailRecipients").setvalue strEmail
									
									.webEdit("StorageLocation").setvalue strStorageLocation
									
									.webList("ReportFormat").selectItem strReportFormat
							
									.webList("DataType").selectItem strDataType
								
									
									.webEdit("Comments").setvalue strComments
									
									.webButton("Cancel").press
									
									  wait Wait10
									 
									 .webElement("ScheduledReports").assertStatus "Visible"
									.webElement("ScheduledReports").assertExist "True"
									
									'TableValidation="Raw Data" & ";" "Every day at 04:18"& ";"
									'.webtable("ScheduledReports").selectRow TableValidation
			                        'wait Wait5
									'.assertFormrecord reportEndOfCampaign,SCHEDULED_DATE & SCHEDULED_TIME,strUiVal,"False"
End With

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_RawData_ValidateCancel", "SCR_EDIT_RDR_TC_007"