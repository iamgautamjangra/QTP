'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File SearchTerm				:	IVMApp_Users_AdvanceSearch_ValidateSearchTerm
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2022
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateSearchTerm", "AAA_ATH_TC_003"
	

'Validate labels

ivm.NavigateToMenu MENU_USERS
wait Wait5
strSearchTerm=testcasedata.getvalue("strSearchTerm")
strSearchTerm2=testcasedata.getvalue("strSearchTerm2")
strSearchTermInv=testcasedata.getvalue("strSearchTermInv")

with ivm.page(User_page)
                            .webLink("AdvancedSearch").press
							wait Wait5
							.webEdit("AdvSearchTerm").setValue strSearchTerm
						   
							.webLink("AdvSearch").press
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertText  "Search Term = "& strSearchTerm 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strSearchTerm,"2"
							wait Wait5	
							.webTable("Users").assertDelValue strSearchTerm2
							.webLink("ClearAll").press
							wait Wait5
							.webElement("SearchTerm_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strSearchTerm2,"2"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("AdvSearchTerm").setValue strSearchTermInv
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							
							.webElement("SearchTerm_Filter").assertText  "Search Term = "& strSearchTermInv 
							
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
						
							.webTable("Users").searchData "The search result is empty."
							
							.webTable("Users").assertDelValue strSearchTerm
							.webTable("Users").assertDelValue strSearchTerm2
							wait Wait5
							
							.webElement("SearchTerm_Filter").press
							
							wait Wait5
							'.webLink("ClearAll").press
							
							'.webLink("ClearAll").assertExist "False"
							.webElement("SearchTerm_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strSearchTerm,"2"
							
							.webTable("Users").assertValue strSearchTerm2,"2"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateSearchTerm", "AAA_ATH_TC_003"

