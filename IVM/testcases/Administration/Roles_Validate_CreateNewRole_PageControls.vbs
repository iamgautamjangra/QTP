'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_CreateNewRole_PageControls
' Description					:	Validate the UI Controls of create new Role page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_PageControls", "AAA_ATH_TC_007"
'Validate the UI Controls of create new Role page and also validate the Functionaity  of Roles Page

ivm.NavigateToMenu MENU_ROLES

ivm.page(Roles_page).webLink("CreateNewRole").press
ivm.page(Roles_page).webElement("CreateNewRole").assertExist "True"
ivm.page(Roles_page).webElement("CreateNewRole").assertStatus "Visible"

ivm.page(Roles_page).webElement("GeneralRoleSettings").assertExist "True"
ivm.page(Roles_page).webElement("GeneralRoleSettings").assertStatus "Visible"

ivm.page(Roles_page).webElement("Description").assertExist "True"
ivm.page(Roles_page).webElement("Description").assertStatus "Visible"

ivm.page(Roles_page).webElement("Permissions").assertExist "True"
ivm.page(Roles_page).webElement("Permissions").assertStatus "Visible"

ivm.page(Roles_page).webElement("PagePermissions").assertExist "True"
ivm.page(Roles_page).webElement("PagePermissions").assertStatus "Visible"

'---------------------------Validate the Page permission table

ivm.page(Roles_page).webTable("PagePermissions").assertValue "Section Name",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Access",2
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Data Analytics",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Reports",1
ivm.page(Roles_page).webTable("LocationPermission").assertValue "SeaChange",1

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_CreateNewRole_PageControls", "AAA_ATH_TC_007"
