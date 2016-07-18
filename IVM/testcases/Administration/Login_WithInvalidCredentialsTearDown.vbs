'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	ivmApp_Administration_AuditLogs_MenuSelection_ValidateAuditLogPageControls
' Description					:	
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

REM strUsername1=testcasedata.value("Username1")
REM strPassword1=testcasedata.value("Password1

ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
 	ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
 	ivm.page(Login_page).webLink("LogIn").press
 	wait Wait5
ivm.page(Common_page).webLink("LogOut").press 
wait Wait5
