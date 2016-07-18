'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_ValidateTableData
' Description					:	Validate the functionality of AdvancedSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_ValidateTableData", "AAA_ATH_TC_003"
	
ivm.NavigateToMenu MENU_USERS
wait 10

with ivm.page(User_page)

							.webList("RowCount").selectItem "Show 100 rows"
						
							wait Wait5
							.webTable("Users").assertTableData grdUsers,""				
						
						
End With
  
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_ValidateTableData", "AAA_ATH_TC_003"

