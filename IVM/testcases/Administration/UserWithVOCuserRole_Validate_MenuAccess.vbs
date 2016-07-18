

'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithVOCuserRole_Validate_MenuAccess
' Description					:	Validate the User With VOC User Menu Access.
' Author 						:   Fonantrix Solution
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithVOCuserRole_Validate_MenuAccess","RBAC_010"

'--------------Login As Admin-------------------------------------------------------------

ivm.page(Login_page).webEdit("Username").setValue Environment.Value("VOC_USER")
ivm.page(Login_page).webEdit("Password").setValue Environment.Value("VOC_PASSWORD")
ivm.page(Login_page).webLink("LogIn").press


 REM '--------------DataAnalytics Link------------------------------------------------------------
	ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"
	ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"
	ivm.page(Common_page).webLink("DataAnalytics").press
wait Wait5
 REM '--------------Reports Link------------------------------------------------------------
 	
		
	ivm.page(Common_page).webLink("Reports").assertExist "True"
	ivm.page(Common_page).webLink("Reports").assertStatus "Visible"
	ivm.page(Common_page).webLink("Reports").press

 wait Wait5
 REM '--------------Available Reports Link------------------------------------------------------------
	ivm.page(Common_page).webLink("AvailableReports").assertExist "True"
	ivm.page(Common_page).webLink("AvailableReports").assertStatus "Visible"
	ivm.page(Common_page).webLink("AvailableReports").press
wait Wait5
 
 REM '--------------Custom Reports Link------------------------------------------------------------  
	ivm.page(Common_page).webLink("CustomReports").assertExist "False"
	ivm.page(Common_page).webLink("CustomReports").assertStatus "Not Visible"
	
 
 REM '--------------Scheduled  Reports Link------------------------------------------------------------
 	ivm.page(Common_page).webLink("ScheduledReports").assertExist "False"
	ivm.page(Common_page).webLink("ScheduledReports").assertStatus "Not Visible"
	

 REM '--------------Monitoring Link-----------------------------------------------------------
 	ivm.page(Common_page).webLink("Monitoring").assertExist "True"
	ivm.page(Common_page).webLink("Monitoring").assertStatus "Visible"
	ivm.page(Common_page).webLink("Monitoring").press
wait Wait5
 REM '--------------Overview Link--------------------------------------------------------------
 
  	REM ivm.page(Common_page).webLink("Overview").assertExist "True"
	REM ivm.page(Common_page).webLink("Overview").assertStatus "Visible"
	REM ivm.page(Common_page).webLink("Overview").press
REM wait Wait5
 REM '--------------Alerts Link--------------------------------------------------------------
 	ivm.page(Common_page).webLink("Alerts").assertExist "True"
	ivm.page(Common_page).webLink("Alerts").assertStatus "Visible"

  REM '--------------Playout Summary Link----------------------------------------------------
  
  	ivm.page(Common_page).webLink("PlayoutSummary").assertExist "False"
	ivm.page(Common_page).webLink("PlayoutSummary").assertStatus "Not Visible"

 REM '--------------Schedule and EventsLink----------------------------------------------------
 
  	ivm.page(Common_page).webLink("ScheduleandEvents").assertExist "False"
	ivm.page(Common_page).webLink("ScheduleandEvents").assertStatus "Not Visible"
	ivm.page(Common_page).webLink("ScheduleandEvents").press 

 REM '-------------Schedule Link--------------------------------------------------------------
 
   	ivm.page(Common_page).webLink("Schedule").assertExist "False"
	ivm.page(Common_page).webLink("Schedule").assertStatus "Not Visible"

 REM '--------------Events Link---------------------------------------------------------
 
    ivm.page(Common_page).webLink("Events").assertExist "False"
	ivm.page(Common_page).webLink("Events").assertStatus "Not Visible"
	
 REM '--------------Schedule Files Link-------------------------------------------------------
 
    ivm.page(Common_page).webLink("ScheduleFiles").assertExist "False"
	ivm.page(Common_page).webLink("ScheduleFiles").assertStatus "Not Visible"
	
 REM '--------------Verification Files Link-----------------------------------------------------
 
    ivm.page(Common_page).webLink("VerificationFiles").assertExist "False"
	ivm.page(Common_page).webLink("VerificationFiles").assertStatus "Not Visible" 

 '--------------System Link---------------------------------------------------------------------
 
     ivm.page(Common_page).webLink("System").assertExist "False"
	ivm.page(Common_page).webLink("System").assertStatus "Not Visible" 
	ivm.page(Common_page).webLink("System").press
	
  '--------------Physical View Link--------------------------------------------------------------
  
   ivm.page(Common_page).webLink("PhysicalView").assertExist "False"
	ivm.page(Common_page).webLink("PhysicalView").assertStatus "Not Visible" 
	
 '--------------Market View Link--------------------------------------------------------------
 
 
    ivm.page(Common_page).webLink("MarketView").assertExist "False"
	ivm.page(Common_page).webLink("MarketView").assertStatus "Not Visible" 
 
 
 
 '--------------System Events Link--------------------------------------------------------------
 
    ivm.page(Common_page).webLink("SystemEvents").assertExist "False"
	ivm.page(Common_page).webLink("SystemEvents").assertStatus "Not Visible" 

'----------------------------------------System Setup---------------------------------------------

    ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
	ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible" 
	ivm.page(Common_page).webLink("SystemSetup").press
	
'-----------------------------------AdvertisingSettings-------------------------------------------

    ivm.page(Common_page).webLink("AdvertisingSettings").assertExist "False"
	ivm.page(Common_page).webLink("AdvertisingSettings").assertStatus "Not Visible" 
	
'----------------------------------Local Settings-------------------------------------------	

		
	ivm.page(Common_page).webLink("LocalSettings").assertExist "False"
	ivm.page(Common_page).webLink("LocalSettings").assertStatus "Not Visible" 
	
	
'----------------------------------Interconnects Settings-------------------------------------	

	ivm.page(Common_page).webLink("Interconnects").assertExist "False"
	ivm.page(Common_page).webLink("Interconnects").assertStatus "Not Visible" 	
	
	
'----------------------------------Region and Markets-------------------------------------------	
		
	ivm.page(Common_page).webLink("MarketManager").assertExist "False"
	ivm.page(Common_page).webLink("MarketManager").assertStatus "Not Visible" 	

'----------------------------------Alert Settings-------------------------------------------	
		
	ivm.page(Common_page).webLink("AlertSettings").assertExist "True"
	ivm.page(Common_page).webLink("AlertSettings").assertStatus "Visible" 
ivm.page(Common_page).webLink("AlertSettings").press
'----------------------------------Alert Settings-------------------------------------------	
		
	ivm.page(Common_page).webLink("AlertDefinitions").assertExist "True"
	ivm.page(Common_page).webLink("AlertDefinitions").assertStatus "Visible" 

	'----------------------------------Notification Groups-------------------------------------------	
		
	ivm.page(Common_page).webLink("NotificationGroups").assertExist "False"
	ivm.page(Common_page).webLink("NotificationGroups").assertStatus "Not Visible" 
	
	'---------------------------------Location Settings-------------------------------------------	

	
    ivm.page(Common_page).webLink("LocationSettings").assertExist "False"
	ivm.page(Common_page).webLink("LocationSettings").assertStatus "Not Visible" 	

'-----------------------------------DeploymentSettings--------------------------------------------

    ivm.page(Common_page).webLink("DeploymentSettings").assertExist "False"
	ivm.page(Common_page).webLink("DeploymentSettings").assertStatus "Not Visible" 


'-----------------------------------SoftwareDeployment--------------------------------------------

    ivm.page(Common_page).webLink("SoftwareDeployment").assertExist "False"
	ivm.page(Common_page).webLink("SoftwareDeployment").assertStatus "Not Visible" 
	
'------------------------------------Hardware configuration------------------------------------------------------------

	
    ivm.page(Common_page).webLink("HardwareConfiguration").assertExist "False"
	ivm.page(Common_page).webLink("HardwareConfiguration").assertStatus "Not Visible" 
		
'------------------------------------Administration-----------------------------------------------------------

    ivm.page(Common_page).webLink("Administration").assertExist "False"
	ivm.page(Common_page).webLink("Administration").assertStatus "Not Visible" 

	
REM '--------------------------------MaintenanceWindows Link--------------------------------------------------
	
	ivm.page(Common_page).webLink("MaintenanceWindows").assertExist "False"
	ivm.page(Common_page).webLink("MaintenanceWindows").assertStatus "Not Visible"
	
		
	'--------------AuditLog Link---------------------------------------------------------------------
	
	ivm.page(Common_page).webLink("AuditLog").assertExist "False"
	ivm.page(Common_page).webLink("AuditLog").assertStatus "Not Visible"
	
	'--------------GlobalSettings Link---------------------------------------------------------------------
	
	ivm.page(Common_page).webLink("GlobalSettings").assertExist "False"
	ivm.page(Common_page).webLink("GlobalSettings").assertStatus "Not Visible"
	
	
'------------------------------------User Manager-------------------------------------------------------------

    ivm.page(Common_page).webLink("UserManager").assertExist "False"
	ivm.page(Common_page).webLink("UserManager").assertStatus "Not Visible" 
	
	
'------------------------------------Users--------------------------------------------------------------------


    ivm.page(Common_page).webLink("Users").assertExist "False"
	ivm.page(Common_page).webLink("Users").assertStatus "Not Visible" 
	
'------------------------------------Roles--------------------------------------------------------------------

    ivm.page(Common_page).webLink("Roles").assertExist "False"
	ivm.page(Common_page).webLink("Roles").assertStatus "Not Visible" 
	


	

ivm.page(Common_page).webLink("LogOut").press
	
wait 7
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithVOCPowerUserRole_Validate_MenuAccess", "RBAC_010"