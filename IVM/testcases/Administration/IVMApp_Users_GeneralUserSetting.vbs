'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_GeneralUserSetting
' Description					:	Validate the UI controls of General User Setting page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_GeneralUserSetting", "AAA_UMG_TC_011"


ivm.NavigateToMenu MENU_USERS
wait Wait5

'ivmApp_Users_GeneralUserSetting
strUsername=testcasedata.getvalue("UserName")

'ivm.page(User_page).webLink("User").press
ivm.page(User_page).webTable("Users").presstblLink strUsername,2
wait 19
ivm.page(User_page).webElement("GeneralUserSettings").assertExist "True"
ivm.page(User_page).webElement("GeneralUserSettings").assertStatus "Visible"

ivm.page(User_page).webElement("UserRole").assertStatus "Visible"
ivm.page(User_page).webElement("UserRole").assertExist "True"

ivm.page(User_page).webElement("Username").assertStatus "Visible"
ivm.page(User_page).webElement("Username").assertExist "True"

ivm.page(User_page).webElement("FullName").assertStatus "Visible"
ivm.page(User_page).webElement("FullName").assertExist "True"

ivm.page(User_page).webElement("Emailaddress").assertStatus "Visible"
ivm.page(User_page).webElement("Emailaddress").assertExist "True"

ivm.page(User_page).webElement("PhoneNumber").assertStatus "Visible"
ivm.page(User_page).webElement("PhoneNumber").assertExist "True"

ivm.page(User_page).webElement("Role").assertStatus "Visible"
ivm.page(User_page).webElement("Role").assertExist "True"

ivm.page(User_page).webElement("Status").assertStatus "Visible"
ivm.page(User_page).webElement("Status").assertExist "True"

ivm.page(User_page).webElement("Status").assertStatus "Visible"
ivm.page(User_page).webElement("Status").assertExist "True"

ivm.page(User_page).webLink("EditDetails").assertStatus "Visible"
ivm.page(User_page).webLink("EditDetails").assertExist "True"

ivm.page(User_page).webLink("EditDetails").press
ivm.page(User_page).webEdit("UserName").assertStatus "Visible"
ivm.page(User_page).webEdit("UserName").assertExist "True"

ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"

'DB Validation

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_GeneralUserSetting", "AAA_UMG_TC_011"
