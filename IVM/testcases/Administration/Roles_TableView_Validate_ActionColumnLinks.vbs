'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	_Roles_TableView_Validate_ActionColumnLinks
' Description					:	Validate the link in Action column of Roles Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "Roles_TableView_Validate_ActionColumnLinks", "AAA_ATH_TC_012"
	

strRoleName=testcasedata.getvalue("RoleName")
strNamevalid=testcasedata.getvalue("Namevalid")
strDescription=testcasedata.getvalue("Description")
strPagePermissionType= testcasedata.getvalue("PermissionType")
strPagePermission = testcasedata.getvalue("PagePermission")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(Roles_page).webLink("Roles").press
'click on Edit
ivm.page(Roles_page).webTable("Roles").pressLink strRoleName,"Edit",5
wait 30

ivm.page(Roles_page).webElement("GeneralRoleSettings").assertExist "True"
ivm.page(Roles_page).webElement("GeneralRoleSettings").assertStatus "Visible"

ivm.page(Roles_page).webTable("PagePermissions").assertValue "Section Name",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Access",2

ivm.page(Roles_page).webTable("PagePermissions").assertValue "Data Analytics",1
REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Dashboard",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Reports",1


ivm.page(Roles_page).webTable("PagePermissions").assertValue "Monitoring",1
REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Overview",1

REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "System Setup",1
REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Advertising Settings",1
REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Regions and Markets",1

REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Location Settings",1
REM ivm.page(Roles_page).webTable("PagePermissions").assertValue "Deployment Settings",1

'------------
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Administration",1


ivm.page(Roles_page).webTable("PagePermissions").assertValue "Maintenance Windows",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Audit Log",1
ivm.page(Roles_page).webTable("PagePermissions").assertValue "Global Settings",1

'Enter the name in the "Name" 

ivm.page(Roles_page).webEdit("RoleName").setValue strNamevalid
ivm.page(Roles_page).webEdit("RoleDescription").setValue strDescription  
ivm.page(Roles_page).webTable("PagePermissions").selectTblListItem strPagePermissionType,strPagePermission,2
ivm.page(Roles_page).webLink("SaveChanges").press 
ivm.page(Roles_page).webLink("CreateNewRole").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Roles_TableView_Validate_ActionColumnLinks", "AAA_ATH_TC_012"


