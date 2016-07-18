'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_AdvancedSearchPopUpWindow_ValidateName
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_AdvancedSearchPopUpWindow_ValidateName", "AAA_ATH_TC_003"
	

'Validate labels
ivm.NavigateToMenu MENU_ROLES
wait Wait5
strName=testcasedata.getvalue("strName")
strName1=testcasedata.getvalue("strName1")
strNameInv=testcasedata.getvalue("strNameInv")

with ivm.page(Roles_page)

							.webEdit("SearchRoleName").setValue strName
						   
							.webLink("AdvSearch").press
							.webElement("Name_Filter").assertExist "True"
							.webElement("Name_Filter").assertText  "Name = "& strName 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Roles").assertExist "True"
							
						
							.webTable("Roles").assertValue strName,"1"
							wait Wait5	
							.webTable("Roles").assertDelValue strName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("Name_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Roles").assertValue strName1,"1"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvanceSearch").press
							wait Wait5
							
							.webEdit("SearchRoleName").setValue strNameInv
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("Name_Filter").assertExist "True"
							
							.webElement("Name_Filter").assertText  "Name = "& strNameInv 
							
							
							.webElement("Name_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Roles").assertExist "True"
						
							.webTable("Roles").searchData "The search result is empty."
							
							.webTable("Roles").assertDelValue strName
							.webTable("Roles").assertDelValue strName1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("Name_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Roles").assertValue strName,"1"
							
							.webTable("Roles").assertValue strName1,"1"
							
							.webTable("Roles").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_AdvancedSearchPopUpWindow_ValidateName", "AAA_ATH_TC_003"

