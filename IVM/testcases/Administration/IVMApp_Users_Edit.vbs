'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UM_Test10_ivmApp_Users_Edit
' Description					:	Validate the "Edit" functionality of User Page.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "UM_Test10_ivmApp_Users_Edit", "AAA_UMG_TC_010"


'Click on the  the "Edit" button.

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").press
wait 9
strUsername=testcasedata.getvalue("Username")
strFullName=testcasedata.getvalue("FullName")
strUsernameLink=testcasedata.getvalue("UsernameLink")
strEmailAddress=testcasedata.getvalue("strEmailAddress")
strPage=testcasedata.getvalue("Page")


ivm.page(User_page).webTable("Users").presstblLink strUsernamelink,6

strUsername1 = ivm.page(User_page).webEdit("UserName").getValue()
strFullname1 = ivm.page(User_page).webEdit("FullName").getValue()
strEmailAddress1 = ivm.page(User_page).webEdit("EmailAddress").getValue()
strRole1= ivm.page(User_page).webList("Roles").getSelectedItem()


ivm.page(User_page).webEdit("UserName").setValue strUsername
ivm.page(User_page).webEdit("FullName").setValue strFullName
ivm.page(User_page).webEdit("EmailAddress").setValue strEmailAddress
ivm.page(User_page).webLink("SaveChanges").press
ivm.page(User_page).webLink("SaveChanges").press
wait 10

strValues = strUsername1 & ";" & strFullname1 &";"& strEmailAddress1 &";" & strRole1 & ";"& strStatus1
ivm.page(Login_page).assertformRecord frmEditUser,"True",strUsername,strUsername


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UM_Test10_ivmApp_Users_Edit", "AAA_UMG_TC_010"
