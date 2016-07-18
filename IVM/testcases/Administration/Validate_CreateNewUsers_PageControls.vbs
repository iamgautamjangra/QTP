'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Validate_CreateNewUsers_PageControls
' Description					:	Validate the "Markets" list box available on the "Schedule a New Report".
' Author 						:   Fonantrix Solution
' Date 							:   22-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Validate_CreateNewUsers_PageControls","RBAC_001"
'msgbox "enterred"

with ivm.page(Common_page)
		.webLink("Administration").press
       .webLink("UserManager").press
       .webLink("Users").press
	   wait 10
       
End with
ivm.page(User_page).webLink("CreateNewUser").press
ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"

with ivm.page(User_page)
		
		wait Wait5
       .webElement("CreateNewUser").assertStatus "Visible"
       .webElement("GeneralUserSettings").assertStatus "Visible"
	   .webEdit("Username").assertExist "True"
       .webEdit("Username").assertStatus "Visible"  					

       .webCheckBox("Userldap").assertExist "True"
       .webCheckBox("Userldap").assertStatus "Visible"					

       .webEdit("FullName").assertExist "True"
       .webEdit("FullName").assertStatus "Visible" 						

       .webEdit("EmailAddress").assertExist "True"
       .webEdit("EmailAddress").assertStatus "Visible"					

       .webLink("AddEmail").assertExist "True"
       .webLink("AddEmail").assertStatus "Visible"

       .webLink("AddPhoneNo").assertExist "True"
       .webLink("AddPhoneNo").assertStatus "Visible"

       .webCheckBox("DeactivateDatecheck").assertExist "True"
       .webCheckBox("DeactivateDatecheck").assertStatus "Visible"   	

       .webList("Roles").assertExist "True"
       .webList("Roles").assertStatus "Visible"							
       .webList("Roles").assertSelectedItem "SeaChange Support"				
       .webImage("MandatoryStar").assertStatus "Visible"	

       .webRadioGroup("Status").assertExist "True"
       .webRadioGroup("Status").assertStatus "Enabled"					
       .webImage("MandatoryStar").assertStatus "Visible"	


       .webLink("CreateUser").assertExist "True"
       .webLink("CreateUser").assertStatus "Visible"    				

       .webLink("Cancel").assertExist "True"
       .webLink("Cancel").assertStatus "Visible" 						

       .webImage("Calendar").assertExist "True"
       .webImage("Calendar").assertStatus "Visible"						

       .webLink("Cancel").press

		ivm.page(Common_page).webLink("LogOut").press
		wait 3

end with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Validate_CreateNewUsers_PageControls", "RBAC_001"

