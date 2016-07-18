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


strEmailAddress=testcasedata.getvalue("EmailAddress")
strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strDeactivatedate=testcasedata.getvalue("Deactivatedate")
strPhoneNumberType = testcasedata.getvalue("PhoneNumberType")
strRoles = testcasedata.getvalue("Roles")
strStatus = testcasedata.getvalue("Status")
strPage=testcasedata.getvalue("Page")


ivm.NavigateToMenu MENU_USERS
wait 5

ivm.page(User_page).webLink("CreateNewUser").press
ivm.page(User_page).webElement("CreateNewUser").assertExist "True"
ivm.page(User_page).webElement("CreateNewUser").assertStatus "Visible"
ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).webEdit("FullName").setValue strFullname
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress
ivm.page(User_page).webLink("AddPhoneNo").press
ivm.page(User_page).webList("SelectPhonenumber").selectItem strPhoneNumberType
ivm.page(User_page).webList("Roles").selectItem strRoles
ivm.page(User_page).webRadioGroup("Status").SelectGroupItem strStatus

ivm.page(User_page).webLink("CreateUser").press
wait 5

ivm.page(Common_page).webLink("LogOut").press 

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Um_Test8_ivmApp_CreateNewUsers_Withvaliddata", "AAA_UMG_TC_008"
