'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	_Roles_TableView_Validate_NameColumnLinks
' Description					:	Validate the functionality of name link in the Role table.
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "Roles_TableView_Validate_NameColumnLinks", "AAA_ATH_TC_011"

	

'Data populated in the Name column of Role table should be same as the data in database.
strUserRoleName=testcasedata.getvalue("UserRoleName")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
wait 2
'Click on the Link Name
ivm.page(Roles_page).webTable("Roles").assertTblLink strUserRoleName,1
ivm.page(Roles_page).webTable("Roles").presstblLink strUserRoleName,1
wait 20
ivm.page(Roles_page).webElement("LastModified").assertExist "True"
ivm.page(Roles_page).webElement("LastModified").assertStatus "Visible"
ivm.page(Roles_page).webElement("GeneralRoleSettings").assertExist "True"
ivm.page(Roles_page).webElement("GeneralRoleSettings").assertStatus "Visible"
'--------------------------------------------------------------------------------------------------------------

ivm.page(Roles_page).webElement("RoleName").assertText strUserRoleName
'Validate the Page permission table
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Section Name",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Access",2

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_TableView_Validate_NameColumnLinks", "AAA_ATH_TC_011"


