'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_UserManagement_AdminUI
' Description					:	Validate the UI Controls of User Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "IVMApp_UserManagement_AdminUI", "AAA_UMG_TC_001"
'Validate the UI of User Page


wait 3
ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"
ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"

ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible"

ivm.page(Common_page).webLink("Administration").assertExist "True"
ivm.page(Common_page).webLink("Administration").assertStatus "Visible"

ivm.page(Common_page).webElement("LoggedIn").assertExist "True"
ivm.page(Common_page).webElement("LoggedIn").assertStatus "Visible"

ivm.page(Common_page).webLink("LogOut").assertExist "True"
ivm.page(Common_page).webLink("LogOut").assertStatus "Visible"

'---UI of Administration page
ivm.page(Common_page).webLink("Administration").press

ivm.page(User_page).webLink("UserManager").assertExist "True"
ivm.page(User_page).webLink("UserManager").assertStatus "Visible"

ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").assertExist "True"
ivm.page(User_page).webLink("Users").assertStatus "Visible"

ivm.page(Roles_page).webLink("Roles").assertExist "True"
ivm.page(Roles_page).webLink("Roles").assertStatus "Visible"

ivm.page(Common_page).webLink("AuditLog").assertExist "True"
ivm.page(Common_page).webLink("AuditLog").assertStatus "Visible"

ivm.page(Common_page).webLink("GlobalSettings").assertExist "True"
ivm.page(Common_page).webLink("GlobalSettings").assertStatus "Visible"


'Validate the User page.
ivm.page(User_page).webLink("CreateNewUser").assertExist "True" 
ivm.page(User_page).webLink("CreateNewUser").assertStatus "Visible"  

'Validate the table's column values exist or not==

ivm.page(User_page).webTable("Users").assertColumnExist "Status","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Username","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Role","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Last Log In","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Last Updated","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Actions","True"

'Validate Search and Advance Search is Present
ivm.page(Common_page).webLink("Search").assertExist "True"
ivm.page(Common_page).webLink("Search").assertStatus "Visible"

ivm.page(Common_page).webLink("AdvanceSearch").assertExist "True"
ivm.page(Common_page).webLink("AdvanceSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("LogOut").press


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_UserManagement_AdminUI", "AAA_UMG_TC_001"