'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	_Roles_TableView_Validate_DeletePageControls
' Description					:	Validate the Delete link in Action column of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "Roles_TableView_Validate_DeletePageControls", "AAA_ATH_TC_019"

strRoleName=testcasedata.getvalue("RoleName")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
wait 4
ivm.page(Roles_page).webTable("Roles").pressLink strRoleName,"Delete",5
wait 10
ivm.page(Roles_page).webLink("DeleteConfirm").assertExist "True"
ivm.page(Roles_page).webLink("DeleteConfirm").assertStatus "Visible"
wait 2
ivm.page(Roles_page).webLink("DeleteConfirm").press
wait 2
ivm.page(Roles_page).assertRecordDeleted frmDeleteRole, "True",strRoleName

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_TableView_Validate_DeletePageControls", "AAA_ATH_TC_019"
