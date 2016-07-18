'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	_Validate_Application_according_to_the_Roles_as_Operator
' Description					:	Validate Application according to the Roles as Operator
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "Validate_Application_according_to_the_Roles_as_Operator", "AAA_ATH_TC_018"
	

'Validate the UI of User Page
ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Selected"
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

ivm.page(Common_page).webLink("Help").assertExist "True"
ivm.page(Common_page).webLink("Help").assertStatus "Visible"

REM ivm.page(Common_page).webLink("Dashboard").assertExist "True"
REM ivm.page(Common_page).webLink("Dashboard").assertStatus "Visible"

ivm.page(Common_page).webLink("Reports").assertExist "True"
ivm.page(Common_page).webLink("Reports").assertStatus "Visible"

REM ivm.page(Common_page).webLink("AddWidget").assertExist "True"
REM ivm.page(Common_page).webLink("AddWidget").assertStatus "Visible"

ivm.page(Common_page).webImage("SeaChangeMgtConsole").assertExist "True"
ivm.page(Common_page).webImage("SeaChangeMgtConsole").assertStatus "Visible"

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


ivm.page(User_page).webLink("Users").assertStatus "Selected"


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Validate_Application_according_to_the_Roles_as_Operator", "AAA_ATH_TC_018"















