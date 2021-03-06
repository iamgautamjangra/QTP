



'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithVOCPowerUserRole_Validate_ReportsAccess
' Description					:	Validate the User With VOC Power User Menu Access.
' Author 						:   Fonantrix Solution 
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithVOCPowerUserRole_Validate_ReportsAccess","RBAC_008"

'--------------Login As Admin------------------------------------------------------------
ivm.page(Login_page).webEdit("Username").setValue Environment.Value("VOCPOWER_USER")
ivm.page(Login_page).webEdit("Password").setValue Environment.Value("VOCPOWER_PASSWORD")
ivm.page(Login_page).webLink("LogIn").press

'----------------------------------------------------------------------------------------------------------------
ivm.page(Common_page).webLink("DataAnalytics").press
ivm.page(Common_page).webLink("Reports").press
ivm.page(Common_page).webLink("AvailableReports").press
wait 7
ivm.page(report_page).webTable("AvailableReports").assertValue "Alert Type Trends",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Alerts Summary",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Device Inventory List",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Failed Insertion Events",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Incorrect Length Videos",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Incorrectly Formatted Videos",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Ingest Failures",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Ingested Videos",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Problematic Schedules",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Problematic Verifications",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Report for Autogenerated Reports",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Run Rates",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Schedule Arrival Rates",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Scheduled Breaks",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Traffic and Billing",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Video Conflicts",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Video Copy and Dispatch Rates",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Video Ingest Rates",1
ivm.page(report_page).webTable("AvailableReports").assertValue "Video Usage Patterns",1

ivm.page(Common_page).webLink("LogOut").press
wait 7
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithVOCPowerUserRole_Validate_ReportsAccess", "RBAC_005"