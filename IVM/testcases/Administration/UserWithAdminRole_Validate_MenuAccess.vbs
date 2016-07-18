

'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithAdminRole_Validate_MenuAccess
' Description					:	Validate the User With Admin Role Menu Access.
' Author 						:   Fonantrix Solution
' Date 							:   26-11-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithAdminRole_Validate_MenuAccess","RBAC_002"

'--------------Login As Admin-------------------------------------------------------------
REM ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
REM ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
REM ivm.page(Login_page).webLink("LogIn").press
REM wait 9


 REM '--------------DataAnalytics Link-------------------------------------------------------------
	ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"
	ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"
	ivm.page(Common_page).webLink("DataAnalytics").press
	wait Wait5

 REM '--------------Reports Link-------------------------------------------------------------
 	
		
	ivm.page(Common_page).webLink("Reports").assertExist "True"
	ivm.page(Common_page).webLink("Reports").assertStatus "Visible"
	ivm.page(Common_page).webLink("Reports").press
	
 	wait Wait5
 REM '--------------Available Reports Link-------------------------------------------------------------
	ivm.page(Common_page).webLink("AvailableReports").assertExist "True"
	ivm.page(Common_page).webLink("AvailableReports").assertStatus "Visible"
	

 
 REM '--------------Custom Reports Link-------------------------------------------------------------  
 
	'ivm.page(Common_page).webLink("CustomReports").assertExist "True"
	'ivm.page(Common_page).webLink("CustomReports").assertStatus "Visible"
	
 
 REM '--------------Scheduled  Reports Link-------------------------------------------------------------
 
 	ivm.page(Common_page).webLink("ScheduledReports").assertExist "True"
	ivm.page(Common_page).webLink("ScheduledReports").assertStatus "Visible"

	
 '--------------Monitoring Link-----------------------------------------------------------
 	
	ivm.page(Common_page).webLink("Monitoring").assertExist "True"
	ivm.page(Common_page).webLink("Monitoring").assertStatus "Visible"
	ivm.page(Common_page).webLink("Monitoring").press
 	wait Wait5

 '--------------Alerts Link--------------------------------------------------------------
 	ivm.page(Common_page).webLink("Alerts").assertExist "True"
	ivm.page(Common_page).webLink("Alerts").assertStatus "Visible"
    ivm.page(Common_page).webLink("Alerts").press 
  '--------------Playout Summary Link----------------------------------------------------
  
  	'ivm.page(Common_page).webLink("PlayoutSummary").assertExist "True"
	'ivm.page(Common_page).webLink("PlayoutSummary").assertStatus "Visible"
 
 '--------------Schedule and EventsLink----------------------------------------------------
 
  	'ivm.page(Common_page).webLink("ScheduleandEvents").assertExist "True"
	'ivm.page(Common_page).webLink("ScheduleandEvents").assertStatus "Visible"
	'ivm.page(Common_page).webLink("ScheduleandEvents").press 
   	'wait Wait5
 REM '-------------Site Link--------------------------------------------------------------
    ivm.page(Common_page).webLink("Site").assertExist "True"
	ivm.page(Common_page).webLink("Site").assertStatus "Visible"
	ivm.page(Common_page).webLink("Site").press 
   	wait Wait5
  REM '-------------Schedule Link--------------------------------------------------------------
   	'ivm.page(Common_page).webLink("Schedule").assertExist "True"
	'ivm.page(Common_page).webLink("Schedule").assertStatus "Visible"
	
 
 REM '--------------Events Link---------------------------------------------------------
 
   ' ivm.page(Common_page).webLink("Events").assertExist "True"
'	ivm.page(Common_page).webLink("Events").assertStatus "Visible"
	
 REM '--------------Schedule Files Link-------------------------------------------------------
 
    'ivm.page(Common_page).webLink("ScheduleFiles").assertExist "True"
	'ivm.page(Common_page).webLink("ScheduleFiles").assertStatus "Visible"
	
 REM '--------------Verification Files Link-----------------------------------------------------
 
    'ivm.page(Common_page).webLink("VerificationFiles").assertExist "True"
	'ivm.page(Common_page).webLink("VerificationFiles").assertStatus "Visible" 

 '--------------System Link---------------------------------------------------------------------
 
     ivm.page(Common_page).webLink("System").assertExist "True"
	ivm.page(Common_page).webLink("System").assertStatus "Visible" 
	ivm.page(Common_page).webLink("System").press
		wait Wait5
  '--------------Physical View Link--------------------------------------------------------------
  
   ivm.page(Common_page).webLink("PhysicalView").assertExist "True"
	ivm.page(Common_page).webLink("PhysicalView").assertStatus "Visible" 
	
 '--------------Market View Link--------------------------------------------------------------
 
 
    ivm.page(Common_page).webLink("MarketView").assertExist "True"
	ivm.page(Common_page).webLink("MarketView").assertStatus "Visible" 
 
 
 
 '--------------System Events Link--------------------------------------------------------------
 
    ivm.page(Common_page).webLink("SystemEvents").assertExist "True"
	ivm.page(Common_page).webLink("SystemEvents").assertStatus "Visible" 
	
	
'----------------------------------------LogViewer---------------------------------------------

    ivm.page(Common_page).webLink("LogViewer").assertExist "True"
	ivm.page(Common_page).webLink("LogViewer").assertStatus "Visible" 

'----------------------------------------Videos---------------------------------------------

   ' ivm.page(Common_page).webLink("Videos").assertExist "True"
	'ivm.page(Common_page).webLink("Videos").assertStatus "Visible" 

'----------------------------------------System Setup---------------------------------------------

    ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
	ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible" 
	ivm.page(Common_page).webLink("SystemSetup").press
		wait Wait5
'-----------------------------------AdvertisingSettings-------------------------------------------

    ivm.page(Common_page).webLink("AdvertisingSettings").assertExist "True"
	ivm.page(Common_page).webLink("AdvertisingSettings").assertStatus "Visible" 
	ivm.page(Common_page).webLink("AdvertisingSettings").press
		wait Wait5

 	
	
	'----------------------------------LocalSettings-------------------------------------------	
		
	ivm.page(Common_page).webLink("LocalSettings").assertExist "True"
	ivm.page(Common_page).webLink("LocalSettings").assertStatus "Visible" 	
	
	
	
'----------------------------------RegionsandMarkets Settings-------------------------------------	

	ivm.page(Common_page).webLink("RegionsandMarkets").assertExist "True"
	ivm.page(Common_page).webLink("RegionsandMarkets").assertStatus "Visible" 	
	
	'----------------------------------Region and Markets-------------------------------------------	
		
	'ivm.page(Common_page).webLink("MarketManager").assertExist "True"
	'ivm.page(Common_page).webLink("MarketManager").assertStatus "Visible" 	
	
	
'----------------------------------Interconnects Settings-------------------------------------	

	'ivm.page(Common_page).webLink("Interconnects").assertExist "True"
	'ivm.page(Common_page).webLink("Interconnects").assertStatus "Visible" 	
	
	'----------------------------------Alert Settings-------------------------------------------	
		
	ivm.page(Common_page).webLink("AlertSettings").assertExist "True"
	ivm.page(Common_page).webLink("AlertSettings").assertStatus "Visible" 
	ivm.page(Common_page).webLink("AlertSettings").press
		wait 10
'----------------------------------Alert Settings-------------------------------------------	
		
	ivm.page(Common_page).webLink("AlertDefinitions").assertExist "True"
	ivm.page(Common_page).webLink("AlertDefinitions").assertStatus "Visible" 

	'----------------------------------Notification Groups-------------------------------------------	
		
	ivm.page(Common_page).webLink("NotificationGroups").assertExist "True"
	ivm.page(Common_page).webLink("NotificationGroups").assertStatus "Visible" 
'----------------------------------Location Settings-------------------------------------------	

    ivm.page(Common_page).webLink("LocationSettings").assertExist "True"
	ivm.page(Common_page).webLink("LocationSettings").assertStatus "Visible"
	
'-----------------------------------DeploymentSettings--------------------------------------------

    ivm.page(Common_page).webLink("DeploymentSettings").assertExist "True"
	ivm.page(Common_page).webLink("DeploymentSettings").assertStatus "Visible" 
	ivm.page(Common_page).webLink("DeploymentSettings").press
	wait Wait5
'-----------------------------------SoftwareDeployment--------------------------------------------

    ivm.page(Common_page).webLink("SoftwareDeployment").assertExist "True"
	ivm.page(Common_page).webLink("SoftwareDeployment").assertStatus "Visible" 
	
'------------------------------------Hardware configuration------------------------------------------------------------

	
    ivm.page(Common_page).webLink("HardwareConfiguration").assertExist "True"
	ivm.page(Common_page).webLink("HardwareConfiguration").assertStatus "Visible" 
		
'------------------------------------Software configuration------------------------------------------------------------

	
    ivm.page(Common_page).webLink("SoftwareConfiguration").assertExist "True"
	ivm.page(Common_page).webLink("SoftwareConfiguration").assertStatus "Visible" 
		
'------------------------------------Administration-----------------------------------------------------------

    ivm.page(Common_page).webLink("Administration").assertExist "True"
	ivm.page(Common_page).webLink("Administration").assertStatus "Visible" 
	ivm.page(Common_page).webLink("Administration").press
		wait 7
REM '--------------------------------MaintenanceWindows Link--------------------------------------------------
	
	ivm.page(Common_page).webLink("MaintenanceWindows").assertExist "True"
	ivm.page(Common_page).webLink("MaintenanceWindows").assertStatus "Visible"
	
		
REM '--------------AuditLog Link---------------------------------------------------------------------
	
	ivm.page(Common_page).webLink("AuditLog").assertExist "True"
	ivm.page(Common_page).webLink("AuditLog").assertStatus "Visible"
	
	'--------------GlobalSettings Link---------------------------------------------------------------------
	
	ivm.page(Common_page).webLink("GlobalSettings").assertExist "True"
	ivm.page(Common_page).webLink("GlobalSettings").assertStatus "Visible"
	
	
'------------------------------------User Manager-------------------------------------------------------------

    ivm.page(Common_page).webLink("UserManager").assertExist "True"
	ivm.page(Common_page).webLink("UserManager").assertStatus "Visible" 
	ivm.page(Common_page).webLink("UserManager").press
		wait Wait5
'------------------------------------Users--------------------------------------------------------------------


    ivm.page(Common_page).webLink("Users").assertExist "True"
	ivm.page(Common_page).webLink("Users").assertStatus "Visible" 
	
'------------------------------------Roles--------------------------------------------------------------------

    ivm.page(Common_page).webLink("Roles").assertExist "True"
	ivm.page(Common_page).webLink("Roles").assertStatus "Visible" 
	
'msgbox "1"
	ivm.page(Common_page).webLink("LogOut").press
	wait Wait5
	
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithAdminRole_Validate_MenuAccess", "RBAC_002"

