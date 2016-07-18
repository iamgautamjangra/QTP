





'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithVOCuserRole_Validate_ReportsAccess
' Description					:	Validate the User With VOC Power User Menu Access.
' Author 						:   Fonantrix Solution 
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithVOCuserRole_Validate_ReportsAccess","RBAC_010"

'--------------Login As Admin------------------------------------------------------------
ivm.page(Login_page).webEdit("Username").setValue Environment.Value("VOCPOWER_USER")
ivm.page(Login_page).webEdit("Password").setValue Environment.Value("VOCPOWER_PASSWORD")
ivm.page(Login_page).webLink("LogIn").press

'----------------------------------------------------------------------------------------------------------------
ivm.page(Common_page).webLink("DataAnalytics").press
ivm.page(Common_page).webLink("Reports").press
ivm.page(Common_page).webLink("AvailableReports").press

ivm.page(report_page).webTable("AvailableReports").assertValue "Alerts Summary",1


ivm.page(Common_page).webLink("LogOut").press
wait 7
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithVOCuserRole_Validate_ReportsAccess", "RBAC_010"