'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Filter_ByAdvanceSearch
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearch", "AAA_ATH_TC_003"
	

'Validate labels
strLocation=testcasedata.getvalue("Location")
strUpdateAt=testcasedata.getvalue("UpdateAt")
strSearchRolename=testcasedata.getvalue("SearchRolename")
strSearchTerm=testcasedata.getvalue("SearchTerm")

strLocationBlank=testcasedata.getvalue("LocationBlank")
strUpdateAtBlank=testcasedata.getvalue("UpdateAtBlank")
strSearchRolenameBlank=testcasedata.getvalue("SearchRolenameBlank")
strSearchTermBlank=testcasedata.getvalue("SearchTermBlank")

with ivm.page(Roles_page)

						.webLink("AdvanceSearch").press
						.webLink("ClearAll").press
						.webEdit("AdvSearchTerm").setValue strSearchTerm
						.webEdit("SearchRoleName").setValue strSearchRolename
                        .selectDate "LastUpdated", UpdateAt

                        .webEdit("Location").setValue strLocation
                        .webLink("Search").press
                        .webLink("CreateNewRole").assertStatus "Visible"
						.webLink("SearchTerm").assertStatus "Visible" 
						.webLink("SearchTerm").assertExist "True"
						.webElement("SearchCriteria").assertStatus "Visible"
						.webElement("SearchCriteria").assertExist "True"
						.webLink("Name").assertStatus "Visible"
						.webLink("Name").assertExist "True"
						.webLink("LocationName").assertStatus "Visible"
						.webLink("LocationName").assertExist "True"
						.webLink("ClearAllSearch").assertStatus "Visible"
						.webLink("ClearAllSearch").assertExist "True"
						
						
End With
============================================================================================


         
ivm.page(Common_page).
ivm.page(Common_page).
ivm.page(Common_page)
ivm.page(Common_page)
ivm.page(Common_page)
ivm.page(Common_page)
ivm.page(Common_page)
ivm.page(Common_page)
ivm.page(Common_page)
'ivm.page(Common_page).webLink("UpdatedAt").assertStatus "Visible"
'ivm.page(Common_page).webLink("UpdatedAt").assertExist "True"

ivm.page(Common_page).webLink("ClearAll").press
'===========================================================
'Validate for Blank Value
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTermBlank
ivm.page(Common_page).webEdit("SearchRoleName").setValue strSearchRolenameBlank

ivm.page(Common_page).webEdit("SearchLocation").setValue strLocationBlank
ivm.page(Common_page).webLink("Search").press
ivm.page(Common_page).webLink("Name").assertExist "False"
ivm.page(Common_page).webLink("ClearAll").press
'=======================================================================
'Validate cancel
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(Common_page).webEdit("SearchRoleName").setValue strSearchRolename
ivm.page(Maintance_page).selectDate grdAuditLogs,"StartDate",strUpdateAt
wait Wait5
REM ivm.page(Common_page).webEdit("LastUpdated").setValue strUpdateAt
ivm.page(Common_page).webEdit("SearchLocation").setValue strLocation
ivm.page(Common_page).webLink("Cancel").press
ivm.page(Roles_page).webLink("CreateNewRole").assertStatus "Visible"

'========================================================================
'Validate for SearchTerm
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(Common_page).webLink("Search").press

'validattion for checking data is present in the table
ivm.page(Roles_page).webTable("Roles").searchdata strSearchTerm

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webLink("SearchTerm").assertStatus "Visible"
ivm.page(Common_page).webLink("SearchTerm").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").press
'--------------------------------------------------------------------------
'Validate for SearchRolename
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Common_page).webEdit("SearchRoleName").setValue strSearchRolename
ivm.page(Common_page).webLink("Search").press

'validation for checking Name in the Role table
ivm.page(Roles_page).webTable("Roles").assertValue strSearchRolename,1
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webLink("Name").assertStatus "Visible"
ivm.page(Common_page).webLink("Name").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press

'=================================================================================
'Validate for UpdateAt
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Maintance_page).selectDate grdAuditLogs,"StartDate",strUpdateAt
wait Wait5
'ivm.page(Common_page).webEdit("LastUpdated").setValue strUpdateAt
ivm.page(Common_page).webLink("Search").press

'validation for checking Name in the UpdateAt
'ivm.page(Roles_page).webTable("Roles").assertValue strUpdateAt,4

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
'ivm.page(Common_page).webLink("UpdatedAt").assertStatus "Visible"
'ivm.page(Common_page).webLink("UpdatedAt").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press

'==================================================================================
'Validate for Location
ivm.page(Common_page).webLink("AdvanceSearch").press
ivm.page(Common_page).webLink("ClearAll").press
ivm.page(Common_page).webEdit("SearchLocation").setValue strLocation
ivm.page(Common_page).webLink("Search").press

'validation for checking Name in the Location
ivm.page(Roles_page).webTable("Roles").assertValue strLocation,3

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webLink("LocationName").assertStatus "Visible"
ivm.page(Common_page).webLink("LocationName").assertExist "True"

ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").press
'===================================================================================

'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearch", "AAA_ATH_TC_003"

