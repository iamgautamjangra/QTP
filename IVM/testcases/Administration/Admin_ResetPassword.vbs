'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Admin_ResetPassword
' Description					:	Validate that admin can reset password successfully
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Admin_ResetPassword", "AAA_AUT_TC_015"


'To check the Logout link on top menu bar
'---UI of Administration page


ivm.NavigateToMenu MENU_USERS
wait 5
strUserEdit=testcasedata.getvalue("UserTOChangePswd")
strMessage=testcasedata.getvalue("Message")


ivm.page(Common_page).webTable("Users").pressTblLink strUserEdit,6
wait 2
ivm.page(User_page).webLink("ResetUserPassword").assertExist "True"
ivm.page(User_page).webLink("ResetUserPassword").press
wait 2

ivm.page(User_page).webElement("ResetemailSent").assertExist "True"
ivm.page(User_page).webElement("ResetemailSent").assertStatus "Visible"
ivm.page(User_page).webElement("ResetemailSent").assertText strMessage
wait 3

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Admin_ResetPassword", "AAA_AUT_TC_015"
