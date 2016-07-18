

'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	UserWithEngineerRole_Validate_MenuAccess
' Description					:	Validate the "Markets" list box available on the "Schedule a New Report".
' Author 						:   Fonantrix Solution
' Date 							:   22-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UserWithEngineerRole_Validate_MenuAccess","RBAC_006"


'--------------Login As Engineer------------
ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ENGINEER_USER")
ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ENGINEER_PASSWORD")
ivm.page(Login_page).webLink("LogIn").press

wait 9

 REM '--------------DataAnalytics Link------------
	ivm.page(Common_page).webLink("DataAnalytics").assertExist "True"
	ivm.page(Common_page).webLink("DataAnalytics").assertStatus "Visible"
	ivm.page(Common_page).webLink("DataAnalytics").press
	
	
 REM '--------------Reports Link------------
 	
		
	ivm.page(Common_page).webLink("Reports").assertExist "True"
	ivm.page(Common_page).webLink("Reports").assertStatus "Visible"
	ivm.page(Common_page).webLink("Reports").press
	
 
 REM '--------------Available Reports Link------------
	ivm.page(Common_page).webLink("AvailableReports").assertExist "True"
	ivm.page(Common_page).webLink("AvailableReports").assertStatus "Visible"
	ivm.page(Common_page).webLink("AvailableReports").press

 
 REM '--------------Custom Reports Link------------  
	ivm.page(Common_page).webLink("CustomReports").assertExist "True"
	ivm.page(Common_page).webLink("CustomReports").assertStatus "Visible"
	
 
 REM '--------------Scheduled  Reports Link------------
 	ivm.page(Common_page).webLink("ScheduledReports").assertExist "True"
	ivm.page(Common_page).webLink("ScheduledReports").assertStatus "Visible"
	
 
 REM '--------------Monitoring Link-----------------------------------------------------------
 	ivm.page(Common_page).webLink("Monitoring").assertExist "True"
	ivm.page(Common_page).webLink("Monitoring").assertStatus "Visible"
	ivm.page(Common_page).webLink("Monitoring").press
 
  
 REM '--------------Alerts Link--------------------------------------------------------------
 	ivm.page(Common_page).webLink("Alerts").assertExist "True"
	ivm.page(Common_page).webLink("Alerts").assertStatus "Visible"
	 
  REM '--------------Playout Summary Link----------------------------------------------------
  
  	ivm.page(Common_page).webLink("PlayoutSummary").assertExist "True"
	ivm.page(Common_page).webLink("PlayoutSummary").assertStatus "Visible"
 
 REM '--------------Schedule and EventsLink----------------------------------------------------
 
  	ivm.page(Common_page).webLink("ScheduleandEvents").assertExist "True"
	ivm.page(Common_page).webLink("ScheduleandEvents").assertStatus "Visible"
	ivm.page(Common_page).webLink("ScheduleandEvents").press 
  
 REM '-------------Schedule Link--------------------------------------------------------------
 
   	ivm.page(Common_page).webLink("Schedule").assertExist "True"
	ivm.page(Common_page).webLink("Schedule").assertStatus "Visible"
	
 REM '--------------Events Link---------------------------------------------------------
 
    ivm.page(Common_page).webLink("Events").assertExist "True"
	ivm.page(Common_page).webLink("Events").assertStatus "Visible"
	
 REM '--------------Schedule Files Link-------------------------------------------------------
 
    ivm.page(Common_page).webLink("ScheduleFiles").assertExist "True"
	ivm.page(Common_page).webLink("ScheduleFiles").assertStatus "Visible"
	
 REM '--------------Verification Files Link-----------------------------------------------------
 
    ivm.page(Common_page).webLink("VerificationFiles").assertExist "True"
	ivm.page(Common_page).webLink("VerificationFiles").assertStatus "Visible" 

 '--------------System Link---------------------------------------------------------------------
 
     ivm.page(Common_page).webLink("System").assertExist "True"
	ivm.page(Common_page).webLink("System").assertStatus "Visible" 
	ivm.page(Common_page).webLink("System").press
  '--------------Physical View Link--------------------------------------------------------------
  
   ivm.page(Common_page).webLink("PhysicalView").assertExist "True"
	ivm.page(Common_page).webLink("PhysicalView").assertStatus "Visible" 
	
 '--------------Market View Link--------------------------------------------------------------
 
 
    ivm.page(Common_page).webLink("MarketView").assertExist "True"
	ivm.page(Common_page).webLink("MarketView").assertStatus "Visible" 
 
 
 
 '--------------System Events Link--------------------------------------------------------------
 
    ivm.page(Common_page).webLink("SystemEvents").assertExist "True"
	ivm.page(Common_page).webLink("SystemEvents").assertStatus "Visible" 

'----------------------------------------System Setup---------------------------------------------

    ivm.page(Common_page).webLink("SystemSetup").assertExist "True"
	ivm.page(Common_page).webLink("SystemSetup").assertStatus "Visible" 
	ivm.page(Common_page).webLink("SystemSetup").press
	
'-----------------------------------AdvertisingSettings-------------------------------------------

    ivm.page(Common_page).webLink("AdvertisingSettings").assertExist "True"
	ivm.page(Common_page).webLink("AdvertisingSettings").assertStatus "Visible" 
	ivm.page(Common_page).webLink("AdvertisingSettings").press
	
'----------------------------------Interconnects Settings-------------------------------------	

	ivm.page(Common_page).webLink("Interconnects").assertExist "True"
	ivm.page(Common_page).webLink("Interconnects").assertStatus "Visible" 	
	
	
'----------------------------------Region and Markets-------------------------------------------	
		
	ivm.page(Common_page).webLink("MarketManager").assertExist "True"
	ivm.page(Common_page).webLink("MarketManager").assertStatus "Visible" 	
	
'----------------------------------Local Settings-------------------------------------------	

    ivm.page(Common_page).webLink("LocalSettings").assertExist "True"
	ivm.page(Common_page).webLink("LocalSettings").assertStatus "Visible"

'---------------------------------Location Settings-------------------------------------------

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
		
'------------------------------------Administration-----------------------------------------------------------

    ivm.page(Common_page).webLink("Administration").assertExist "True"
	ivm.page(Common_page).webLink("Administration").assertStatus "Visible" 
	ivm.page(Common_page).webLink("Administration").press
	
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
	
'------------------------------------Users--------------------------------------------------------------------


    ivm.page(Common_page).webLink("Users").assertExist "True"
	ivm.page(Common_page).webLink("Users").assertStatus "Visible" 
	
'------------------------------------Roles--------------------------------------------------------------------

    ivm.page(Common_page).webLink("Roles").assertExist "True"
	ivm.page(Common_page).webLink("Roles").assertStatus "Visible" 
	


	ivm.page(Common_page).webLink("LogOut").press
	wait 7

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UserWithEngineerRole_Validate_MenuAccess", "RBAC_006"
