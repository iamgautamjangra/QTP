

'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	CreateNewUser_Engineer_VOCPowerUser_VOCuser
' Description					:	CreateNewUser Engineer VOCPowerUser VOCuser
' Author 						:   Fonantrix Solution
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------


'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CreateNewUser_Engineer_VOCPowerUser_VOCuser","RBAC_002"


ivm.NavigateToMenu MENU_USERS
wait 7
strEmailAddress=testcasedata.getvalue("EmailAddress")
strUsername=testcasedata.getvalue("Username")
strFullname=testcasedata.getvalue("Fullname")
strDeactivatedate=testcasedata.getvalue("Deactivatedate")
strPhoneNumberType = testcasedata.getvalue("PhoneNumberType")
strRoles = testcasedata.getvalue("Roles")
strStatus = testcasedata.getvalue("Status")
strPage=testcasedata.getvalue("Page")
strUserldap=testcasedata.getvalue("strUserldap")

ivm.page(User_page).webLink("CreateNewUser").press
wait 15
ivm.page(User_page).webEdit("UserName").setValue strUsername
wait 3
ivm.page(User_page).WebcheckBox("Userldap").setState strUserldap
ivm.page(User_page).webEdit("FullName").setValue strFullname
wait 3

'ivm.page(User_page).webLink("AddEmail").press
wait 3
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress

ivm.page(User_page).webList("Roles").selectItem strRoles

ivm.page(User_page).webRadioGroup("Status").SelectGroupItem strStatus

ivm.page(User_page).webLink("CreateUser").press
wait Wait5



'Validation of the Created user in data base
strUIValues = strUsername & ";" & strFullname & ";" & strEmailAddress & ";" & strPhoneNumberType & ";" & strPhoneNumber & ";" & strRoles & ";" & strStatus & ";" & strDeactivatedate

strValues = strUsername & ";" & strFullname &";"& strEmailAddress &";" & strRoles & ";"& strStatus
ivm.page(Login_page).assertformRecord frmCreateNewUser,"True",strUsername,strUsername

wait 3
ivm.page(Common_page).webLink("LogOut").press
wait 7
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CreateNewUser_Engineer_VOCPowerUser_VOCuser", "RBAC_002"

