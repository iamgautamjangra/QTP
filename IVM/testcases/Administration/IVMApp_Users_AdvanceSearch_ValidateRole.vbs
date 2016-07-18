'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Role				:	IVMApp_Users_AdvanceSearch_ValidateRole
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2022
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateRole", "AAA_ATH_TC_003"
	

'Validate labels

ivm.NavigateToMenu MENU_USERS
wait Wait5
strRole=testcasedata.getvalue("strRole")
strRole2=testcasedata.getvalue("strRole2")
strRoleInv=testcasedata.getvalue("strRoleInv")

with ivm.page(User_page)
                            .webLink("AdvancedSearch").press
							wait Wait5
							.webEdit("Role").setValue strRole
						   
							.webLink("AdvSearch").press
							.webElement("Role_Filter").assertExist "True"
							.webElement("Role_Filter").assertText  "Role = "& strRole 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strRole,"3"
							wait Wait5	
							.webTable("Users").assertDelValue strRole2
							.webLink("ClearAll").press
							wait Wait5
							.webElement("Role_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strRole2,"3"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("Role").setValue strRoleInv
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("Role_Filter").assertExist "True"
							
							.webElement("Role_Filter").assertText  "Role = "& strRoleInv 
							
							
							.webElement("Role_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
						
							.webTable("Users").searchData "The search result is empty."
							
							.webTable("Users").assertDelValue strRole
							.webTable("Users").assertDelValue strRole2
							wait Wait5
							
							.webElement("Role_Filter").press
							
							wait Wait5
							'.webLink("ClearAll").press
							
							'.webLink("ClearAll").assertExist "False"
							.webElement("Role_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strRole,"3"
							
							.webTable("Users").assertValue strRole2,"3"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateRole", "AAA_ATH_TC_003"

