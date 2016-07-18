'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_CreateNewUsers_ValidateBackToPreviousPage
' Description					:	Validate the UI controls of Create New User Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_ValidateBackToPreviousPage", "AAA_UMG_TC_007"

	

'Validate the UI of Create New User Page
'UI controls of "Create New User page" should be visible:-

ivm.NavigateToMenu MENU_USERS
wait Wait5
ivm.page(User_page).webLink("CreateNewUser").press

ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"
ivm.page(User_page).webElement("CreateNewUser").assertStatus "Visible"
ivm.page(User_page).webElement("GeneralUserSettings").assertStatus "Visible"

ivm.page(User_page).webEdit("Username").assertExist "True"
ivm.page(User_page).webEdit("Username").assertStatus "Visible"  					

'ivm.page(User_page).webCheckBox("Userldap").assertExist "True"
'ivm.page(User_page).webCheckBox("Userldap").assertStatus "Visible"					

ivm.page(User_page).webEdit("FullName").assertExist "True"
ivm.page(User_page).webEdit("FullName").assertStatus "Visible" 						

	

ivm.page(User_page).webLink("AddEmail").assertExist "True"
ivm.page(User_page).webLink("AddEmail").assertStatus "Visible"

ivm.page(User_page).webLink("AddPhoneNo").assertExist "True"
ivm.page(User_page).webLink("AddPhoneNo").assertStatus "Visible"

ivm.page(User_page).webCheckBox("DeactivateDatecheck").assertExist "True"
ivm.page(User_page).webCheckBox("DeactivateDatecheck").assertStatus "Visible"   	

ivm.page(User_page).webList("Roles").assertExist "True"
ivm.page(User_page).webList("Roles").assertStatus "Visible"							
ivm.page(User_page).webList("Roles").assertSelectedItem "Administrator"				
ivm.page(User_page).webImage("MandatoryStar").assertStatus "Visible"	

ivm.page(User_page).webRadioGroup("Status").assertExist "True"
ivm.page(User_page).webRadioGroup("Status").assertStatus "Enabled"					
ivm.page(User_page).webImage("MandatoryStar").assertStatus "Visible"	


ivm.page(User_page).webLink("CreateUser").assertExist "True"
ivm.page(User_page).webLink("CreateUser").assertStatus "Visible"    				

ivm.page(User_page).webLink("Cancel").assertExist "True"
ivm.page(User_page).webLink("Cancel").assertStatus "Visible" 						

ivm.page(User_page).webImage("Calendar").assertExist "True"
ivm.page(User_page).webImage("Calendar").assertStatus "Visible"			

ivm.page(Common_page).webLink("BackToPreviousPage").press
wait Wait5
REM ivm.page(confirmation_page).webButton("OK").press	
REM wait 2

ivm.page(User_page).webLink("CreateNewUser").assertExist "True" 
ivm.page(User_page).webLink("CreateNewUser").assertStatus "Visible"  

'Validate the table's column values exist or not==

ivm.page(User_page).webTable("Users").assertColumnExist "Status","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Username","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Role","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Last Log In","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Last Updated","True"
ivm.page(User_page).webTable("Users").assertColumnExist "Actions","True"		



'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_ValidateBackToPreviousPage", "AAA_UMG_TC_007"


