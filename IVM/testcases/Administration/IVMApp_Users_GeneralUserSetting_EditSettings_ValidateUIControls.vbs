'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_GeneralUserSetting_EditSettings_ValidateUIControls
' Description					:	Validate the UI controls of General User Setting page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_GeneralUserSetting_EditSettings_ValidateUIControls", "AAA_UMG_TC_011"


ivm.NavigateToMenu MENU_USERS
wait Wait5

strUsername=testcasedata.getvalue("UserName")
strFullName=testcasedata.getvalue("strFullName")
strEmailAddress=testcasedata.getvalue("strEmailAddress")
strPhoneNumnber=testcasedata.getvalue("strPhoneNumnber")
strNumber=testcasedata.getvalue("strNumber")
strRole=testcasedata.getvalue("strRole")

'ivm.page(User_page).webLink("User").press
with ivm.page(User_page)
                    .webTable("Users").presstblLink strUsername,2
                     wait 19
					 
					 
					.webLink("EditDetails").assertStatus "Visible"
					.webLink("EditDetails").assertExist "True"
					 .webLink("EditDetails").press
					 wait Wait5
				    .webElement("GeneralUserSettings").assertExist "True"
                    .webElement("GeneralUserSettings").assertStatus "Visible"

				    .webElement("UserRole").assertStatus "Visible"
                    .webElement("UserRole").assertExist "True"
					
					.webElement("Username").assertStatus "Visible"
				    .webElement("Username").assertExist "True"
					
					.webEdit("UserName").assertStatus "Visible"
					.webEdit("UserName").assertExist "True"
					.webEdit("UserName").assertValue strUserName

                   

				    .webElement("FullName").assertStatus "Visible"
				    .webElement("FullName").assertExist "True"
					
					.webEdit("FullName").assertStatus "Visible"
					.webEdit("FullName").assertExist "True"
					.webEdit("FullName").assertValue strFullName

				    .webElement("Emailaddress").assertStatus "Visible"
					.webElement("Emailaddress").assertExist "True"
					
					.webEdit("Emailaddress").assertStatus "Visible"
					.webEdit("Emailaddress").assertExist "True"
					.webEdit("Emailaddress").assertValue strEmailAddress

					.webElement("PhoneNumber").assertStatus "Visible"
					.webElement("PhoneNumber").assertExist "True"
					
					.webEdit("PhoneNumber").assertStatus "Visible"
					.webEdit("PhoneNumber").assertExist "True"
					.webEdit("PhoneNumber").assertValue strNumber
					.webList("SelectPhonenumber").assertselectedItem strPhoneNumnber
					.webElement("Role").assertStatus "Visible"
					.webElement("Role").assertExist "True"
					.webList("Roles").assertselectedItem strRole
                    
					.webElement("Status").assertStatus "Visible"
					.webElement("Status").assertExist "True"

					.webElement("Status").assertStatus "Visible"
					.webElement("Status").assertExist "True"
					
end with					

ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
					
ivm.page(User_page).webLink("Cancel").press
					

'DB Validation

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_GeneralUserSetting_EditSettings_ValidateUIControls", "AAA_UMG_TC_011"
