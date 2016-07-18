'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Filter_ByAdvanceSearchCancel
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearchCancel", "AAA_ATH_TC_003"
	
ivm.NavigateToMenu MENU_ROLES
wait Wait5
'Validate labels
strLocation=testcasedata.getvalue("Location")
UpdateAt=testcasedata.getvalue("UpdateAt")
strSearchRolename=testcasedata.getvalue("SearchRolename")
strSearchTerm=testcasedata.getvalue("SearchTerm")

with ivm.page(Roles_page)

						.webLink("AdvanceSearch").press
						.webLink("ClearAll").press
						.webEdit("AdvSearchTerm").setValue strSearchTerm
						.webEdit("SearchRoleName").setValue strSearchRolename
                        .selectDate "LastUpdated", UpdateAt

                        .webEdit("Location").setValue strLocation
                        .webLink("AdvCancel").press
                        .webLink("CreateNewRole").assertStatus "Visible"
						.webElement("SearchCriteria").assertExist "False" 
End With						
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearchCancel","AAA_ATH_TC_003"