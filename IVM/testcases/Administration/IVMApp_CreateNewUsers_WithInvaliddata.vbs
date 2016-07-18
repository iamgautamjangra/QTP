'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_CreateNewUsers_WithInvaliddata
' Description					:	Validate the Create New User Page with invalid data
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_WithInvaliddata", "AAA_UMG_TC_009"


strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strEmailAddress=testcasedata.getvalue("EmailAddress")

strUsernameErr=testcasedata.getvalue("UsernameErr")
strFullnameErr=testcasedata.getvalue("FullnameErr")
strEmailAddressErr=testcasedata.getvalue("EmailAddressErr")

strUsernameErr = Replace(strUsernameErr,"#",",")

'Click on "Create New" User Create New User page should be  opened.


ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").press

ivm.page(User_page).webLink("CreateNewUser").press
'-----------------------------------------------------------------------------------------------------------
wait 3
'Leave all the fields .Click on "Create User" Button
ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).webEdit("FullName").setValue strFullname
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress
ivm.page(User_page).webLink("CreateUser").press


'Error message should be displayed with the mandatory fields.
ivm.page(User_page).webElement("UsernameErr").assertExist "True"
ivm.page(User_page).webElement("UsernameErr").assertStatus "Visible"
ivm.page(User_page).webElement("UsernameErr").assertErrorText strUsernameErr

ivm.page(User_page).webElement("FullNameErr").assertExist "True"
ivm.page(User_page).webElement("FullNameErr").assertStatus "Visible"
ivm.page(User_page).webElement("FullnameErr").assertErrorText strFullnameErr

ivm.page(User_page).webElement("EmailAddressErr").assertExist "True"
ivm.page(User_page).webElement("EmailAddressErr").assertStatus "Visible"
ivm.page(User_page).webElement("EmailAddressErr").assertErrorText strEmailAddressErr

ivm.page(User_page).webElement("UserErrorInfo").assertExist "True"
ivm.page(User_page).webElement("UserErrorInfo").assertStatus "Visible"
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText "The user was not created due to the following issues:"
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText strUsernameErr
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText strFullnameErr
ivm.page(User_page).webElement("UserErrorInfo").assertErrorInfoText strEmailAddressErr

ivm.page(User_page).webLink("Cancel").press
wait Wait5
'ivm.page(confirmation_page).webButton("OK").press

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_CreateNewUsers_WithInvaliddata", "AAA_UMG_TC_009"
