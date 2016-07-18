'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserLogged_With_SeaChangeSupportRole_ValidateApplicationAccess
' Description					:	Validate Application according to the Roles as SeaChangeSupport
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case

executionController.startTestCase_w_TestCaseNumber "UserLogged_With_SeaChangeSupportRole_ValidateApplicationAccess", "AAA_ATH_TC_017"
 
 	

'Validate the UI of User Page
With ivm.page(Common_page)
			.webLink("Monitoring").assertExist "True"
			.webLink("Monitoring").assertStatus "Visible"

			.webLink("SystemSetup").assertExist "True"
			.webLink("SystemSetup").assertStatus "Visible"

			.webLink("Administration").assertExist "True"
			.webLink("Administration").assertStatus "Visible"

			.webElement("LoggedIn").assertExist "True"
			.webElement("LoggedIn").assertStatus "Visible"

			.webLink("LogOut").assertExist "True"
			.webLink("LogOut").assertStatus "Visible"
End With

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

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserLogged_With_SeaChangeSupportRole_ValidateApplicationAccess", "AAA_ATH_TC_017"
