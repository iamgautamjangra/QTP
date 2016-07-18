'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Um_Test8_ivmApp_CreateNewUsers_Withvaliddata
' Description					:	Validate the Create New User Page with valid data
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "Um_Test8_ivmApp_CreateNewUsers_Withvaliddata", "AAA_UMG_TC_008"
'ivmApp_CreateNewUsers_Withvaliddata

strEmailAddress=testcasedata.getvalue("EmailAddress")
strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strDeactivatedate=testcasedata.getvalue("Deactivatedate")
strPhoneNumberType = testcasedata.getvalue("PhoneNumberType")
strRoles = testcasedata.getvalue("Roles")
strStatus = testcasedata.getvalue("Status")
strPage=testcasedata.getvalue("Page")


ivm.NavigateToMenu MENU_USERS
wait Wait5

ivm.page(User_page).webLink("CreateNewUser").press
ivm.page(User_page).webElement("CreateNewUser").assertExist "True"
ivm.page(User_page).webElement("CreateNewUser").assertStatus "Visible"

ivm.page(User_page).webEdit("UserName").setValue strUsername

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
wait Wait5

'Validation of the Created user in data base
strUIValues = strUsername & ";" & strFullname & ";" & strEmailAddress & ";" & strPhoneNumberType & ";" & strPhoneNumber & ";" & strRoles & ";" & strStatus & ";" & strDeactivatedate

strValues = strUsername & ";" & strFullname &";"& strEmailAddress &";" & strRoles & ";"& strStatus
ivm.page(Login_page).assertformRecord frmCreateNewUser,"True",strUsername,strUsername

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Um_Test8_ivmApp_CreateNewUsers_Withvaliddata", "AAA_UMG_TC_008"
