'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	ivmApp_Administration_UserManager_Role_MenuSelection_ValidateRolesPageControls
' Description					:	Validate the UI Controls on Role Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ivmApp_Administration_UserManager_Role_MenuSelection_ValidateRolesPageControls", "AAA_ATH_TC_001"

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
wait 9
with ivm.page(User_page)
	                .webLink("UserManager").press
	                .webLink("UserManager").assertExist "True"
	                .webLink("UserManager").assertStatus "Selected"
End with
with ivm.page(Roles_page)
	                 .webLink("Roles").press
	                 .webLink("CreateNewRole").assertExist "True"
	                 .webLink("CreateNewRole").assertStatus "Visible"

					'Validate the UI Controls of the Roles page.'"Create New Role" Button
	                 .webTable("Roles").assertColumnExist "Name","True"	
	                 .webTable("Roles").assertColumnExist "Description","True"
	                 .webTable("Roles").assertColumnExist "Location","True"	
	                 .webTable("Roles").assertColumnExist "Last Updated","True"	
	                 .webTable("Roles").assertColumnExist "Actions","True"		
			
	                 .webEdit("Search").assertExist "True"			
	                 .webEdit("Search").assertStatus "Visible"							
	                 .webLink("AdvanceSearch").assertExist "True"					
	                 .webLink("AdvanceSearch").assertStatus "Visible"					
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ivmApp_Administration_UserManager_Role_MenuSelection_ValidateRolesPageControls", "AAA_ATH_TC_001"