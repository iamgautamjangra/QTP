'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EmailRecipients_ValidateEmailFormat
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EmailRecipients_ValidateEmailFormat", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testCaseData.getValue("ReportName")
strEmail=testCaseData.getValue("strEmail")
strEmail1=testCaseData.getValue("strEmail1")
strEmail2=testCaseData.getValue("strEmail2")
strEmail3=testCaseData.getValue("strEmail3")

with ivm.page(ScheduledReports_Page)
			
				
									.webLink("ScheduleNewReport").press
									 wait 10
									
									
									.webRadiogroup("ReportType").selectGroupItem ReportName
									wait 8
									
									.webEdit("EmailRecipients").setValue strEmail
									.webButton("Schedule").press
									wait 3
									.webElement("EmailFormatIncorrect").assertExist "True"
									.webElement("EmailFormatIncorrect").assertStatus "Visible"
									.webElement("EmailFormatIncorrect").assertText "E-mail address format is incorrect."
									
									.webEdit("EmailRecipients").setValue strEmail1
									.webButton("Schedule").press
									wait 3
									.webElement("EmailFormatIncorrect").assertExist "True"
									.webElement("EmailFormatIncorrect").assertStatus "Visible"
									.webElement("EmailFormatIncorrect").assertText "E-mail address format is incorrect."
									
									.webEdit("EmailRecipients").setValue strEmail2
									.webButton("Schedule").press
									wait 3
									.webElement("EmailFormatIncorrect").assertExist "True"
									.webElement("EmailFormatIncorrect").assertStatus "Visible"
									.webElement("EmailFormatIncorrect").assertText "E-mail address format is incorrect."
									
									.webEdit("EmailRecipients").setValue strEmail3
									.webButton("Schedule").press
									wait 3
									.webElement("EmailFormatIncorrect").assertExist "True"
									.webElement("EmailFormatIncorrect").assertStatus "Visible"
									.webElement("EmailFormatIncorrect").assertText "E-mail address format is incorrect."
									
									
end with

executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EmailRecipients_ValidateEmailFormat", "SCR_NEW_RDR_TC_001"

