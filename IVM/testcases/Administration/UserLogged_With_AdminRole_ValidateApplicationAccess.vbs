'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserLogged_With_AdminRole_ValidateApplicationAccess
' Description					:	Validate Application according to the Roles as Admin
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "UserLogged_With_AdminRole_ValidateApplicationAccess", "AAA_ATH_TC_016"

 'Validate the UI of User Page

ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"
ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"

ivm.page(Common_page).webLink("Monitoring").assertExist "True"
ivm.page(Common_page).webLink("Monitoring").assertStatus "Visible"

ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible"

ivm.page(Common_page).webLink("Administration").assertExist "True"
ivm.page(Common_page).webLink("Administration").assertStatus "Visible"

ivm.page(Common_page).webElement("LoggedIn").assertExist "True"
ivm.page(Common_page).webElement("LoggedIn").assertStatus "Visible"

ivm.page(Common_page).webLink("LogOut").assertExist "True"
ivm.page(Common_page).webLink("LogOut").assertStatus "Visible"

ivm.page(Common_page).webLink("Reports").assertExist "True"
ivm.page(Common_page).webLink("Reports").assertStatus "Visible"


'Click on the "Administration" Link.
'---UI of Administration page

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press

ivm.page(User_page).webLink("UserManager").assertExist "True"
ivm.page(User_page).webLink("UserManager").assertStatus "Visible"

ivm.page(User_page).webLink("Users").assertExist "True"
ivm.page(User_page).webLink("Users").assertStatus "Visible"

ivm.page(Roles_page).webLink("Roles").assertExist "True"
ivm.page(Roles_page).webLink("Roles").assertStatus "Visible"

ivm.page(Common_page).webLink("AuditLog").assertExist "True"
ivm.page(Common_page).webLink("AuditLog").assertStatus "Visible"

ivm.page(Common_page).webLink("GlobalSettings").assertExist "True"
ivm.page(Common_page).webLink("GlobalSettings").assertStatus "Visible"


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserLogged_With_AdminRole_ValidateApplicationAccess", "AAA_ATH_TC_016"
