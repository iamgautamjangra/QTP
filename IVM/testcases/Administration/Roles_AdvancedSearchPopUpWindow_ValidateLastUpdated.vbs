'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File LastUpdated						:	Roles_AdvancedSearchPopUpWindow_ValidateLastUpdated
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_AdvancedSearchPopUpWindow_ValidateLastUpdated", "AAA_ATH_TC_003"
	

'Validate labels
ivm.NavigateToMenu MENU_ROLES
wait Wait5
strLastUpdated=testcasedata.getvalue("strLastUpdated")
strLastUpdated1=testcasedata.getvalue("strLastUpdated1")
strLastUpdatedInv=testcasedata.getvalue("strLastUpdatedInv")

with ivm.page(Roles_page)

							.webLink("AdvanceSearch").press
							wait 2
							 .selectDate "LastUpdated", strLastUpdated
							 wait 2
							 .webLink("AdvSearch").press
							wait Wait5	
							.webElement("LastUpdated_Filter").assertExist "True"
							.webElement("LastUpdated_Filter").assertText  "Last Updated = "& strLastUpdated 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Roles").assertExist "True"
							
						
							.webTable("Roles").assertValue strLastUpdated,"1"
							wait Wait5	
							.webTable("Roles").assertDelValue strLastUpdated1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("LastUpdated_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Roles").assertValue strLastUpdated1,"1"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvanceSearch").press
							wait Wait5
							
							 .selectDate "LastUpdated", strLastUpdatedInv
							 wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("LastUpdated_Filter").assertExist "True"
							
							.webElement("LastUpdated_Filter").assertText  "Last Updated = "& strLastUpdatedInv 
							
							
							.webElement("LastUpdated_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Roles").assertExist "True"
						
							.webTable("Roles").searchData "The search result is empty."
							
							.webTable("Roles").assertDelValue strLastUpdated
							.webTable("Roles").assertDelValue strLastUpdated1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("LastUpdated_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Roles").assertValue strLastUpdated,"1"
							
							.webTable("Roles").assertValue strLastUpdated1,"1"
							
							.webTable("Roles").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_AdvancedSearchPopUpWindow_ValidateLastUpdated", "AAA_ATH_TC_003"