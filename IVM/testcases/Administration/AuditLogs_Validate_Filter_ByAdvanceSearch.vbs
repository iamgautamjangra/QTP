'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Test3_AuditLogs_Validate_Filter_ByAdvanceSearch
' Description					:	Validate Filter by Advance Search dropdown of Audit Log page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Test3_AuditLogs_Validate_Filter_ByAdvanceSearch", "AAA_AUL_TC_003"
 
 
strSearchTerm=testcasedata.getvalue("SearchTerm")
strSearchStartTime=REPORT_START_DATE1
strSearchEndTime=REPORT_END_DATE1
strSearchUserName=testcasedata.getvalue("SearchUserName")
strSearchUserAction=testcasedata.getvalue("SearchUserAction")
strSearchItemType=testcasedata.getvalue("SearchItemType")
strSearchItemName=testcasedata.getvalue("SearchItemName")

strSearchTermBlank=testcasedata.getvalue("SearchTermBlank")
strSearchStartTimeBlank=testcasedata.getvalue("SearchStartTimeBlank")
strSearchEndTimeBlank=testcasedata.getvalue("SearchEndTimeBlank")
strSearchUserNameBlank=testcasedata.getvalue("SearchUserNameBlank")
strSearchUserActionBlank=testcasedata.getvalue("SearchUserActionBlank")
strSearchItemTypeBlank=testcasedata.getvalue("SearchItemTypeBlank")
strSearchItemNameBlank=testcasedata.getvalue("SearchItemNameBlank")

ivm.page(Common_page).webLink("Administration").press
wait wait5
ivm.page(User_page).webLink("UserManager").press
wait wait5
ivm.page(Common_page).webLink("AuditLog").press
wait wait5
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5

'Validate UI
ivm.page(AuditLog_page).webElement("SearchTerm").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("SearchTerm").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchTerm").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchTerm").assertExist "True"

ivm.page(AuditLog_page).webElement("StartTime").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("StartTime").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchStartTime").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchStartTime").assertExist "True"

ivm.page(AuditLog_page).webElement("EndTime").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("EndTime").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchEndTime").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchEndTime").assertExist "True"

ivm.page(AuditLog_page).webElement("User").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("User").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchUserName").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchUserName").assertExist "True"

ivm.page(AuditLog_page).webElement("UserAction").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("UserAction").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchUserAction").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchUserAction").assertExist "True"

ivm.page(AuditLog_page).webImage("calendar").assertStatus "Visible"
ivm.page(AuditLog_page).webImage("calendar").assertExist "True"

ivm.page(AuditLog_page).webElement("ItemType").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("ItemType").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchItemType").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchItemType").assertExist "True"

ivm.page(AuditLog_page).webElement("ItemName").assertStatus "Visible"
ivm.page(AuditLog_page).webElement("ItemName").assertExist "True"
ivm.page(AuditLog_page).webEdit("SearchItemName").assertStatus "Visible"
ivm.page(AuditLog_page).webEdit("SearchItemName").assertExist "True"

ivm.page(AuditLog_page).webLink("Search").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("Search").assertExist "True"

ivm.page(AuditLog_page).webLink("Cancel").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("Cancel").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAll").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAll").assertExist "True"
'========================================================================================
'Validate for Valid Data for all fields

ivm.page(AuditLog_page).webEdit("SearchTerm").setValue strSearchTerm

ivm.page(Maintance_page).selectDate "StartDate",strSearchStartTime

ivm.page(Maintance_page).selectDate "EndDate",strSearchEndTime

ivm.page(AuditLog_page).webEdit("SearchUserName").setValue strSearchUserName
ivm.page(AuditLog_page).webEdit("SearchUserAction").setValue strSearchUserAction
ivm.page(AuditLog_page).webEdit("SearchItemType").setValue strSearchItemType
ivm.page(AuditLog_page).webEdit("SearchItemName").setValue strSearchItemName

ivm.page(AuditLog_page).webLink("Search").press
wait wait5


ivm.page(AuditLog_page).webLink("ClearAllSearch").press

'========================================================================================
'Validate for Blank Value
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait10
ivm.page(AuditLog_page).webEdit("SearchTerm").setValue strSearchTermBlank
ivm.page(AuditLog_page).webEdit("SearchUserName").setValue strSearchUserNameBlank
ivm.page(AuditLog_page).webEdit("SearchUserAction").setValue strSearchUserActionBlank
ivm.page(AuditLog_page).webEdit("SearchItemType").setValue strSearchItemTypeBlank
ivm.page(AuditLog_page).webEdit("SearchItemName").setValue strSearchItemNameBlank
ivm.page(AuditLog_page).webLink("Search").press
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"

'========================================================================================
'Validate Cancel
ivm.page(AuditLog_page).webEdit("SearchTerm").setValue strSearchTerm

ivm.page(AuditLog_page).webEdit("SearchUserName").setValue strSearchUserName
ivm.page(AuditLog_page).webEdit("SearchUserAction").setValue strSearchUserAction
ivm.page(AuditLog_page).webEdit("SearchItemType").setValue strSearchItemType
ivm.page(AuditLog_page).webEdit("SearchItemName").setValue strSearchItemName
ivm.page(AuditLog_page).webLink("Cancel").press
ivm.page(AuditLog_page).webElement("AuditLog").assertStatus "Visible"
'========================================================================================
'Validate  SearchTerm
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait10
ivm.page(AuditLog_page).webEdit("SearchTerm").setValue strSearchTerm
ivm.page(AuditLog_page).webLink("Search").press
wait wait10
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(AuditLog_page).webLink("SearchTerm").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("SearchTerm").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait10
'========================================================================================
wait wait5
'Validate for Username
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5
ivm.page(AuditLog_page).webEdit("SearchUserName").setValue strSearchUserName
ivm.page(AuditLog_page).webLink("Search").press
wait wait5
ivm.page(AuditLog_page).webTable("AuditLog").assertValue strSearchUserName,2

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(AuditLog_page).webLink("UserName").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("UserName").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5
REM '========================================================================================
REM 'Validate UserAction
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5
ivm.page(AuditLog_page).webEdit("SearchUserAction").setValue strSearchUserAction
ivm.page(AuditLog_page).webLink("Search").press
wait wait5
'ivm.page(AuditLog_page).webTable("AuditLog").assertValue strSearchUserAction,3
wait wait10
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(AuditLog_page).webLink("UserAction").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("UserAction").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5

'=======================================================================================
'Validate StartTime
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5
ivm.page(Maintance_page).selectDate grdAuditLogs,"StartDate",strSearchStartTime
 ivm.page(AuditLog_page).webLink("Search").press
wait wait10
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"


ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5

'=======================================================================================================
'Validate EndTime
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5


ivm.page(Maintance_page).selectDate grdAuditLogs,"EndDate",strSearchEndTime
wait wait10
ivm.page(AuditLog_page).webLink("Search").press
wait wait5

ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(AuditLog_page).webLink("EndTime").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("EndTime").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5

'========================================================================================

'Validate Item Type
ivm.page(Common_page).webLink("AdvanceSearch").press
wait wait5
ivm.page(AuditLog_page).webEdit("SearchItemType").setValue strSearchItemType
ivm.page(AuditLog_page).webLink("Search").press
wait wait5
ivm.page(AuditLog_page).webTable("AuditLog").assertValue strSearchItemType,4

REM ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
REM ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"

ivm.page(AuditLog_page).webLink("ItemType").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ItemType").assertExist "True"

ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(AuditLog_page).webLink("ClearAllSearch").press
wait wait5

'========================================================================================
'Validate Item Name
ivm.page(AuditLog_page).webEdit("SearchItemName").setValue strSearchItemName
ivm.page(AuditLog_page).webLink("Search").press
wait wait5
ivm.page(AuditLog_page).webTable("AuditLog").assertValue strSearchItemName,5

REM ivm.page(AuditLog_page).webLink("ClearAllSearch").assertStatus "Visible"
REM ivm.page(AuditLog_page).webLink("ClearAllSearch").assertExist "True"
REM ivm.page(AuditLog_page).webLink("ClearAllSearch").press
REM wait wait5

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "Test3_AuditLogs_Validate_Filter_ByAdvanceSearch", "AAA_AUL_TC_003"





