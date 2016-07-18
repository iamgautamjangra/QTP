'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_AdvanceSearch_ClearAll
' Description					:	Validate the functionality of AdvancedSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ClearAll", "AAA_ATH_TC_003"
	
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
						.selectDate "LastLogIn", strLastLogInInv
						wait 2
						.selectDate "LastUpdated", strLastUpdated
						.webEdit("Role").setValue strRole
						.webEdit("UserName").setValue strUserNameInv
						.webList("Status").selectItem strStatus
						.webLink("AdvClearAll").press
						 wait 4
						
						.webEdit("LastLogIn").assertValue ""
						wait 2
						.webEdit("LastUpdated").assertValue  ""
						.webEdit("Role").assertValue ""
						.webEdit("UserName").assertValue ""
						.webList("Status").assertSelectedItem "All"
								
						.weblink("AdvCancel").press	
						
						
End With
  
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ClearAll", "AAA_ATH_TC_003"

