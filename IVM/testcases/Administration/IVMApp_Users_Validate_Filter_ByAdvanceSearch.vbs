'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_Validate_Filter_ByAdvanceSearch
' Description					:	Validate the Advance Search filter for Users
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_Validate_Filter_ByAdvanceSearch", "AAA_UMG_TC_012"
'Validate the Advance Search filter for Users

strSearchTerm=testcasedata.getvalue("SearchTerm")
strSearchUserName=testcasedata.getvalue("UserName")
strStatus=testcasedata.getvalue("Status")
strSearchRole=testcasedata.getvalue("Role")
strSearchLastSession=testcasedata.getvalue("LastSession")
strSearchUpdated=testcasedata.getvalue("Updated")

strSearchTermBlank=testcasedata.getvalue("SearchTermBlank")
strSearchUserNameBlank=testcasedata.getvalue("UserNameBlank")
strStatusDefault=testcasedata.getvalue("StatusDefault")
strSearchRoleBlank=testcasedata.getvalue("RoleBlank")
strSearchLastSessionBlank=testcasedata.getvalue("LastSessionBlank")
strSearchUpdatedBlank=testcasedata.getvalue("UpdatedBlank")

ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
wait 10
ivm.page(User_page).webLink("Users").press
wait 10
ivm.page(Common_page).webLink("AdvanceSearch").press
wait 2

'Validate UI
ivm.page(Common_page).webElement("Status").assertStatus "Visible"
ivm.page(Common_page).webElement("Status").assertExist "True"
ivm.page(Common_page).webList("SearchStatus").assertStatus "Visible"
ivm.page(Common_page).webList("SearchStatus").assertExist "True"

ivm.page(Common_page).webElement("Username").assertStatus "Visible"
ivm.page(Common_page).webElement("Username").assertExist "True"
ivm.page(Common_page).webEdit("SearchUserName").assertStatus "Visible"
ivm.page(Common_page).webEdit("SearchUserName").assertExist "True"

ivm.page(Common_page).webElement("Roles").assertStatus "Visible"
ivm.page(Common_page).webElement("Roles").assertExist "True"
ivm.page(Common_page).webEdit("SearchRole").assertStatus "Visible"
ivm.page(Common_page).webEdit("SearchRole").assertExist "True"

ivm.page(Common_page).webElement("LastLogIn").assertStatus "Visible"
ivm.page(Common_page).webElement("LastLogIn").assertExist "True"


ivm.page(Common_page).webElement("LastUpdated").assertStatus "Visible"
ivm.page(Common_page).webElement("LastUpdated").assertExist "True"

ivm.page(Common_page).webImage("calendar").assertStatus "Visible"
ivm.page(Common_page).webImage("calendar").assertExist "True"

ivm.page(Common_page).webLink("Search").assertStatus "Visible"
ivm.page(Common_page).webLink("Search").assertExist "True"
ivm.page(Common_page).webLink("Cancel").assertStatus "Visible"
ivm.page(Common_page).webLink("Cancel").assertExist "True"
ivm.page(Common_page).webLink("ClearAll").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAll").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press
'============================================================
' Validate for blank value
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTermBlank
ivm.page(Common_page).webEdit("SearchUserName").setValue strSearchUserNameBlank

ivm.page(Common_page).webEdit("SearchRole").setValue strSearchRoleBlank

ivm.page(Common_page).webLink("Search").press
ivm.page(Common_page).webLink("ClearAllSearch").press


'===========================================================================
'Validate the Cancel Button

ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(Common_page).webEdit("SearchUserName").setValue strSearchUserName

ivm.page(Common_page).webLink("Cancel").press
ivm.page(User_page).webLink("CreateNewUser").assertExist "True"
ivm.page(User_page).webLink("CreateNewUser").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").press


'===========================================================================
'Validate for valid Value in all fields
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(Common_page).webEdit("SearchUserName").setValue strSearchUserName

ivm.page(Common_page).webEdit("SearchRole").setValue strSearchRole


ivm.page(Common_page).webLink("Search").press

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(Common_page).webLink("SearchTerm").assertStatus "Visible"
ivm.page(Common_page).webLink("SearchTerm").assertExist "True"


ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press
'=========================================================================================

'Validate for Search Term
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(Common_page).webLink("Search").press

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(Common_page).webLink("SearchTerm").assertStatus "Visible"
ivm.page(Common_page).webLink("SearchTerm").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press

'===============================================
'Validate for Search User Name
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchUserName").setValue strSearchUserName
ivm.page(Common_page).webLink("Search").press

ivm.page(User_page).webTable("Users").assertValue strSearchUserName,2

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(Common_page).webLink("SearchUserName").assertStatus "Visible"
ivm.page(Common_page).webLink("SearchUserName").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press
'===============================================================

'Validate for Role

ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchRole").setValue strSearchRole
ivm.page(Common_page).webLink("Search").press

ivm.page(User_page).webTable("Users").assertValue strSearchRole,3
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(Common_page).webLink("Roles").assertStatus "Visible"
ivm.page(Common_page).webLink("Roles").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press


'========================================
'Validate for  Updated

ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webEdit("SearchUserName").setValue strSearchUserName
ivm.page(Common_page).webLink("Search").press
wait 10

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UM_Test12_ivmApp_Users_Validate_Filter_ByAdvanceSearch", "AAA_UMG_TC_012"
