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
ivm.NavigateToMenu MENU_ROLES
wait Wait5
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
                        .webLink("AdvClearAll").press
						wait 3
						.webEdit("AdvSearchTerm").assertValue "Search..."
						.webEdit("SearchRoleName").assertValue ""
                        .webEdit("LastUpdated").assertValue ""
                        .webEdit("Location").assertValue ""
                        
						.webElement("SearchCriteria").assertExist "False" 
End With	

'===================================================================================

'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearch", "AAA_ATH_TC_003"

