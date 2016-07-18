'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_AdvancedSearch_AllFilters
' Description					:	Validate the functionality of AdvancedSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvancedSearch_AllFilters", "AAA_ATH_TC_003"
	
ivm.NavigateToMenu MENU_USERS
wait 10
'Validate labels
strStatus=testcasedata.getvalue("strStatus")
strRole=testcasedata.getvalue("strRole")
strLastUpdated=testcasedata.getvalue("strLastUpdated")
strUserName=testcasedata.getvalue("strUserName")
strLastLogIn=testcasedata.getvalue("strLastLogIn")
strUserNameInv=testcasedata.getvalue("strUserNameInv")
strLastLogInInv=testcasedata.getvalue("strLastLogInInv")

with ivm.page(User_page)

						.webLink("AdvancedSearch").press
						 wait Wait5
						.selectDate "LastLogIn", strLastLogIn
						wait 2
						.selectDate "LastUpdated", strLastUpdated
						.webEdit("Role").setValue strRole
						.webEdit("UserName").setValue strUserName
						.webList("Status").selectItem strStatus
						.webLink("AdvSearch").press
						 wait 4
						.webElement("Status_Filter").assertExist "True"
						.webElement("Status_Filter").assertText  "Status = "& strStatus 
						
						.webElement("Role_Filter").assertExist "True"
						.webElement("Role_Filter").assertText  "Role = "& strRole 
						
						.webElement("LastUpdated_Filter").assertExist "True"
						.webElement("LastUpdated_Filter").assertText  "Last Updated = "& strLastUpdated 
						
						.webElement("UserName_Filter").assertExist "True"
						.webElement("UserName_Filter").assertText  "User Name = "& strUserName 
						
						.webElement("LastLogIn_Filter").assertExist "True"
						.webElement("LastLogIn_Filter").assertText  "Last Log In = "& strLastLogIn
						  
						 .webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
							
						.webTable("Users").assertExist "True"
						
						.webTable("Users").assertValue strUserName,"2"
							wait Wait5	
						.webTable("Users").assertValue strStatus,"1" 
						
						.webTable("Users").assertValue strRole,"3" 
						.webTable("Users").assertValue strLastUpdated,"5" 
						.webTable("Users").assertValue strLastLogIn,"4" 
						
						.webElement("LastLogIn_Filter").press
						wait 2
						.webElement("LastLogIn_Filter").assertExist "False"
						
						.weblink("ClearAll").press
						
	'for inValid			
                      .webLink("AdvancedSearch").press
						 wait Wait5
						.selectDate "LastLogIn", strLastLogInInv
						wait 2
						.selectDate "LastUpdated", strLastUpdated
						.webEdit("Role").setValue strRole
						.webEdit("UserName").setValue strUserNameInv
						.webList("Status").selectItem strStatus
						.webLink("AdvSearch").press
						 wait 4
						.webElement("Status_Filter").assertExist "True"
						.webElement("Status_Filter").assertText  "Status = "& strStatus 
						
						.webElement("Role_Filter").assertExist "True"
						.webElement("Role_Filter").assertText  "Role = "& strRole 
						
						.webElement("LastUpdated_Filter").assertExist "True"
						.webElement("LastUpdated_Filter").assertText  "Last Updated = "& strLastUpdated 
						
						.webElement("UserName_Filter").assertExist "True"
						.webElement("UserName_Filter").assertText  "User Name = "& strUserNameInv 
						
						.webElement("LastLogIn_Filter").assertExist "True"
						.webElement("LastLogIn_Filter").assertText  "Last Log In = "& strLastLogInInv
						  
						 .webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
							
						.webTable("Users").assertExist "True"
						
						.webTable("Users").assertValue "The search result is empty."
						
						.webElement("LastLogIn_Filter").press
						wait 5
						..webElement("UserName_Filter").press
						wait 5
						
						.webTable("Users").assertValue strStatus,"1" 
						
						.webTable("Users").assertValue strRole,"3" 
						.webTable("Users").assertValue strLastUpdated,"5" 
												
											
						.weblink("ClearAll").press	
						
						
End With
============================================================================================


  
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvancedSearch_AllFilters", "AAA_ATH_TC_003"

