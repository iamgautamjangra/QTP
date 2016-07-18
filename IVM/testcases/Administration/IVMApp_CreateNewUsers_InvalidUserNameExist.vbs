'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_CreateNewUsers_InvalidUserNameExist
' Description					:	Validate the Create New User Page with valid data
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_InvalidUserNameExist", "AAA_UMG_TC_015"
strEmailAddress=testcasedata.getvalue("EmailAddress")
strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strDeactivatedate=testcasedata.getvalue("Deactivatedate")
strPhoneNumberType = testcasedata.getvalue("PhoneNumberType")
strRoles = testcasedata.getvalue("Roles")
strStatus = testcasedata.getvalue("Status")
strPage=testcasedata.getvalue("Page")
strUsernameErr=testcasedata.getvalue("UsernameErr")
strEmailAddressErr =testcasedata.getvalue("EmailAddressErr")

ivm.logIn
wait 2
ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").press

ivm.page(User_page).webLink("CreateNewUser").press
wait Wait5
ivm.page(User_page).webElement("CreateNewUser").assertExist "True"
ivm.page(User_page).webElement("CreateNewUser").assertStatus "Visible"

ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).WebcheckBox("Userldap").setState strUserldap
ivm.page(User_page).webEdit("FullName").setValue strFullname
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress

ivm.page(User_page).webLink("AddPhoneNo").press
ivm.page(User_page).webList("SelectPhonenumber").assertExist "True"
ivm.page(User_page).webList("SelectPhonenumber").assertStatus "Visible"
ivm.page(User_page).webList("SelectPhonenumber").selectItem strPhoneNumberType

ivm.page(User_page).webEdit("PhoneNumber").assertExist "True"
ivm.page(User_page).webEdit("PhoneNumber").assertStatus "Visible"
ivm.page(User_page).webElement("Password").assertExist "True"
ivm.page(User_page).webElement("Password").assertStatus "Visible"

ivm.page(User_page).webList("Roles").selectItem strRoles
ivm.page(User_page).webRadioGroup("Status").SelectGroupItem strStatus
ivm.page(User_page).webLink("CreateUser").press

ivm.page(User_page).webLink("CreateNewUser").press
ivm.page(User_page).webElement("CreateNewUser").assertExist "True"
ivm.page(User_page).webElement("CreateNewUser").assertStatus "Visible"

ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).WebcheckBox("Userldap").setState strUserldap
ivm.page(User_page).webEdit("FullName").setValue strFullname


ivm.page(User_page).webLink("AddPhoneNo").press
ivm.page(User_page).webList("SelectPhonenumber").assertExist "True"
ivm.page(User_page).webList("SelectPhonenumber").assertStatus "Visible"
ivm.page(User_page).webList("SelectPhonenumber").selectItem strPhoneNumberType

ivm.page(User_page).webEdit("PhoneNumber").assertExist "True"
ivm.page(User_page).webEdit("PhoneNumber").assertStatus "Visible"
ivm.page(User_page).webElement("Password").assertExist "True"
ivm.page(User_page).webElement("Password").assertStatus "Visible"

ivm.page(User_page).webList("Roles").selectItem strRoles
ivm.page(User_page).webRadioGroup("Status").SelectGroupItem strStatus
ivm.page(User_page).webLink("CreateUser").press

'Error message should be displayed with the mandatory fields.
ivm.page(User_page).webElement("UsernameErr").assertExist "True"
ivm.page(User_page).webElement("UsernameErr").assertStatus "Visible"
ivm.page(User_page).webElement("UsernameErr").assertErrorText strUsernameErr


ivm.page(User_page).webElement("UserErrorInfo").assertExist "True"
ivm.page(User_page).webElement("UserErrorInfo").assertStatus "Visible"
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText "The user was not created due to the following issues:"
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText strUsernameErr

ivm.page(User_page).webLink("Cancel").press

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_InvalidUserNameExist", "AAA_UMG_TC_015"