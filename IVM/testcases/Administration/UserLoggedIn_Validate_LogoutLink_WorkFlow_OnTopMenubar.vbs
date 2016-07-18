'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserLoggedIn_Validate_LogoutLink_WorkFlow_OnTopMenubar
' Description					:	Validate the logout Link displayed on the top Menu bar
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "UserLoggedIn_Validate_LogoutLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_013"

'---To check the Logout link on top menu bar

with ivm.page(User_page)
	ivm.page(Common_page).webLink("LogOut").assertExist "True"
	ivm.page(Common_page).webLink("LogOut").assertStatus "Visible"
wait Wait5
End With
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserLoggedIn_Validate_LogoutLink_WorkFlow_OnTopMenubar", "AAA_AUT_TC_013"
