

'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithAdminRole_Validate_ReportsAccess
' Description					:	Validate the User With VOC Power User Menu Access.
' Author 						:   Fonantrix Solution
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithAdminRole_Validate_ReportsAccess","RBAC_005"


'------------------------------------Login As Admin-----------------------------------------------------------
ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
ivm.page(Login_page).webLink("LogIn").press


'----------------------------------------------------------------------------------------------------------------
ivm.page(Common_page).webLink("DataAnalytics").press
ivm.page(Common_page).webLink("Reports").press
ivm.page(Common_page).webLink("AvailableReports").press
wait Wait5
ivm.page(report_page).webTable("AvailableReports").assertValue "Advertisement And Program Details",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Advertisement Summary",1
ivm.page(report_page).webTable("AvailableReports").assertValue "All Details",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Campaign Summary",1
ivm.page(report_page).webTable("AvailableReports").assertValue "End of Campaign",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Program Summary",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Raw Data",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Region Summary",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Unique Customers",1
ivm.page(report_page).webTable("AvailableReports").assertValue "VOD Ad Delivery Data Feed",1

ivm.page(Common_page).webLink("LogOut").press
wait 7
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithAdminRole_Validate_ReportsAccess", "RBAC_005"