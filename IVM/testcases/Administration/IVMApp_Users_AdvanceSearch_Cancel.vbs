'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_AdvanceSearch_Cancel
' Description					:	Validate the functionality of AdvancedSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_Cancel", "AAA_ATH_TC_003"
	
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
						 wait 5
						.selectDate "LastLogIn", strLastLogInInv
						wait 2
						.selectDate "LastUpdated", strLastUpdated
						.webEdit("Role").setValue strRole
						.webEdit("UserName").setValue strUserNameInv
						.webList("Status").selectItem strStatus
						.webLink("AdvCancel").press
						 wait 4
						.webElement("Status_Filter").assertExist "False"
												
						.webElement("Role_Filter").assertExist "False"
												
						.webElement("LastUpdated_Filter").assertExist "False"
						
						.webElement("UserName_Filter").assertExist "False"
												
						.webElement("LastLogIn_Filter").assertExist "False"
										  
						 .webLink("ClearAll").assertExist "False"
													
						.webTable("Users").assertExist "True"
						
						.webTable("Users").assertValue strUserName,"2"
							wait 5	
						.webTable("Users").assertValue strStatus,"1" 
						
						.webTable("Users").assertValue strRole,"3" 
						.webTable("Users").assertValue strLastUpdated,"5" 
						.webTable("Users").assertValue strLastLogIn,"4" 
						
										
		
                      .webLink("AdvancedSearch").press
						 wait 5
						.webEdit("LastLogIn").assertValue strLastLogInInv
						wait 2
						.webEdit("LastUpdated").assertValue  strLastUpdated
						.webEdit("Role").assertValue strRole
						.webEdit("UserName").assertValue strUserNameInv
						.webList("Status").assertSelectedItem strStatus
								
						.weblink("AdvCancel").press	
						
						
End With
  
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_Cancel", "AAA_ATH_TC_003"

