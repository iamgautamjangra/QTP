'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File LastLogIn				:	IVMApp_Users_AdvanceSearch_ValidateLastLogin
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateLastLogin", "AAA_ATH_TC_003"
	

'Validate labels
ivm.NavigateToMenu MENU_USERS
wait Wait5
strLastLogIn=testcasedata.getvalue("strLastLogIn")
strLastLogIn1=testcasedata.getvalue("strLastLogIn1")
strLastLogInInv=testcasedata.getvalue("strLastLogInInv")

with ivm.page(User_page)

							.webLink("AdvancedSearch").press
							wait 2
							 .selectDate "LastLogIn", strLastLogIn
							 wait 2
							 .webLink("AdvSearch").press
							wait Wait5	
							.webElement("LastLogIn_Filter").assertExist "True"
							.webElement("LastLogIn_Filter").assertText  "Last Log In = "& strLastLogIn 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strLastLogIn,"5"
							wait Wait5	
							.webTable("Users").assertDelValue strLastLogIn1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("LastLogIn_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strLastLogIn1,"5"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							 .selectDate "LastLogIn", strLastLogInInv
							 wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("LastLogIn_Filter").assertExist "True"
							
							.webElement("LastLogIn_Filter").assertText  "Last Log In = "& strLastLogInInv 
							
							
							.webElement("LastLogIn_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
						
							.webTable("Users").searchData "The search result is empty."
							
							.webTable("Users").assertDelValue strLastLogIn
							.webTable("Users").assertDelValue strLastLogIn1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("LastLogIn_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strLastLogIn,"5"
							
							.webTable("Users").assertValue strLastLogIn1,"5"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateLastLogin", "AAA_ATH_TC_003"