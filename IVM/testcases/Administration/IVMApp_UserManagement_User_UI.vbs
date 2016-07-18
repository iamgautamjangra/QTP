'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_UserManagement_User_UI
' Description					:	Validate the UI of SeaChange User
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_UserManagement_User_UI", "AAA_UMG_TC_004"
	
REM 'Validate UI
REM 'strSiteName= Environment.Value("strSiteName")
ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"
ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"

ivm.page(Common_page).webLink("DataAnalytics").press
ivm.page(Common_page).webLink("Reports").assertExist "True"
ivm.page(Common_page).webLink("Reports").assertStatus "Visible"

ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible"

ivm.page(Common_page).webLink("Administration").assertExist "True"
ivm.page(Common_page).webLink("Administration").assertStatus "Visible"

ivm.page(Common_page).webElement("LoggedIn").assertExist "True"
ivm.page(Common_page).webElement("LoggedIn").assertStatus "Visible"

ivm.page(Common_page).webLink("LogOut").assertExist "True"
ivm.page(Common_page).webLink("LogOut").assertStatus "Visible"

'ivm.page(Common_page).webLink("Help").assertExist "True"
'ivm.page(Common_page).webLink("Help").assertStatus "Visible"



'ivm.page(Common_page).webImage("SeaChangeMgtConsole").assertExist "True"
'ivm.page(Common_page).webImage("SeaChangeMgtConsole").assertStatus "Visible"

'Click on the "Administration" Link.
'---UI of Administration page

ivm.page(Common_page).webLink("Administration").press

ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").press

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


'Validate that default page is User.

ivm.page(User_page).webLink("Users").assertStatus "Selected"

'Validate the User page.

ivm.page(User_page).webLink("CreateNewUser").assertExist "True"
ivm.page(User_page).webLink("CreateNewUser").assertStatus "Visible"  'Create New User

'Validate the table's column values exist or not also assert which column is sortable

ivm.page(User_page).webTable("Users").assertColumnExist "Status","True"

ivm.page(User_page).webTable("Users").assertColumnExist "Username","True"
ivm.page(User_page).webTable("Users").assertTblLink "Username",2

ivm.page(User_page).webTable("Users").assertColumnExist "Role","True"
ivm.page(User_page).webTable("Users").assertTblLink "Role",3

ivm.page(User_page).webTable("Users").assertColumnExist "Last Log In","True"
ivm.page(User_page).webTable("Users").assertTblLink "Last Log In",4

ivm.page(User_page).webTable("Users").assertColumnExist "Last Updated","True"
ivm.page(User_page).webTable("Users").assertTblLink "Last Updated",5

ivm.page(User_page).webTable("Users").assertColumnExist "Actions","True"

'Validate Search and Advance Search is Present

ivm.page(Common_page).webLink("Search").assertExist "True"
ivm.page(Common_page).webLink("Search").assertStatus "Visible"

ivm.page(Common_page).webLink("AdvanceSearch").assertExist "True"
ivm.page(Common_page).webLink("AdvanceSearch").assertStatus "Visible"

'Validate table
ivm.page(User_page).webTable("Users").assertTableData grdUsers,""

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_UserManagement_User_UI", "AAA_UMG_TC_004"
