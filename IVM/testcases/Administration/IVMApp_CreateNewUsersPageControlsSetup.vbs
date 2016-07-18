'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Test1_ivmApp_Administration_AuditLogs_MenuSelection_ValidateAuditLogPageControls
' Description					:	
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
REM '--------------------------------------------------------------------------------------------------------------------------------------------------
 
ivm.page(Common_page).webLink("LogOut").press
wait 2
ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
 ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
 ivm.page(Login_page).webLink("LogIn").press