'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_ValidateEmailRecipients
' Description					:	Validate the Page Controls of the Schedule new report page.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_ValidateEmailRecipients", "SCR_NEW_RDR_TC_001"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testCaseData.getValue("SearchVal")
strEmail=testCaseData.getValue("strEmail")
strEmail1=testCaseData.getValue("strEmail1")
strEmail2=testCaseData.getValue("strEmail2")
strEmail3=testCaseData.getValue("strEmail3")

with ivm.page(ScheduledReports_Page)
			
				
									.webTable("ScheduledReports").selectRow SearchVal
									 wait 10
									
									.webEdit("EmailRecipients").setValue strEmail
									wait 3
									.webButton("SaveChanges").press
									wait 3
									.assertExistwe "E-mail address format is incorrect."
									REM .webElement("EmailFormatIncorrect").assertExist "True"
									REM .webElement("EmailFormatIncorrect").assertStatus "Visible"
									REM .webElement("SelectAMonth").assertText "E-mail address format is incorrect."
									
									REM .webEdit("EmailRecipients").setValue strEmail1
									REM .webButton("Schedule").press
									REM wait 3
									REM .webElement("EmailFormatIncorrect").assertExist "True"
									REM .webElement("EmailFormatIncorrect").assertStatus "Visible"
									REM .webElement("SelectAMonth").assertText "E-mail address format is incorrect."
									
									REM .webEdit("EmailRecipients").setValue strEmail2
									REM .webButton("Schedule").press
									REM wait 3
									REM .webElement("EmailFormatIncorrect").assertExist "True"
									REM .webElement("EmailFormatIncorrect").assertStatus "Visible"
									REM .webElement("SelectAMonth").assertText "E-mail address format is incorrect."
									
									REM .webEdit("EmailRecipients").setValue strEmail3
									REM .webButton("Schedule").press
									REM wait 3
									REM .webElement("EmailFormatIncorrect").assertExist "True"
									REM .webElement("EmailFormatIncorrect").assertStatus "Visible"
									REM .webElement("SelectAMonth").assertText "E-mail address format is incorrect."
									
									
end with

executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_ValidateEmailRecipients", "SCR_NEW_RDR_TC_001"

