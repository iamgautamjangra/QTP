'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_ValidateLoginPageControls
' Description					:	Validate UI of login page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
  
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_ValidateLoginPageControls", "AAA_AUT_TC_001"

'validate UI
ivm.page(Login_page).webImage("SeaChangeMgtConsole").assertExist "True"     
ivm.page(Login_page).webImage("SeaChangeMgtConsole").assertStatus "Visible"

ivm.page(Login_page).webElement("Username").assertExist	"True"	 
ivm.page(Login_page).webElement("Username").assertStatus "Visible"	 		
ivm.page(Login_page).webEdit("Username").assertExist "True"		       
ivm.page(Login_page).webEdit("Username").assertStatus "Visible"		    

ivm.page(Login_page).webElement("Password").assertExist  "True"	     
ivm.page(Login_page).webElement("Password").assertStatus "Visible"	 	
ivm.page(Login_page).webEdit("Password").assertExist "True"	 	         
ivm.page(Login_page).webEdit("Password").assertStatus "Visible"	 	     

ivm.page(Login_page).webLink("Login").assertExist "True"			         
ivm.page(Login_page).webLink("Login").assertStatus "Visible"	 			 

ivm.page(Login_page).webElement("StaySignedIn").assertExist "True"  
ivm.page(Login_page).webElement("StaySignedIn").assertStatus "Visible" 	

ivm.page(Login_page).webCheckbox("StaySignedIn").assertExist "True" 		
ivm.page(Login_page).webCheckbox("StaySignedIn").assertStatus "Visible" 	 

ivm.page(Login_page).webLink("ForgotPassword").assertExist "True" 	 	 	
ivm.page(Login_page).webLink("ForgotPassword").assertStatus	"Visible" 	 	

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "IVMApp_ValidateLoginPageControls", "AAA_AUT_TC_001"
