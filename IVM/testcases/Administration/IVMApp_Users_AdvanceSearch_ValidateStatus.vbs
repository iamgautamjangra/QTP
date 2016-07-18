'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Status				:	IVMApp_Users_AdvanceSearch_ValidateStatus
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   10-06-1011
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateStatus", "AAA_ATH_TC_003"
	

'Validate labels

ivm.NavigateToMenu MENU_USERS
wait Wait5
strStatus=testcasedata.getvalue("strStatus")
strStatus1=testcasedata.getvalue("strStatus1")
strStatusAll=testcasedata.getvalue("strStatusAll")

with ivm.page(User_page)
                            .webLink("AdvancedSearch").press
							wait Wait5
							.webList("Status").selectItem strStatus
						   wait 2
							.webLink("AdvSearch").press
							.webElement("Status_Filter").assertExist "True"
							.webElement("Status_Filter").assertText  "Status = "& strStatus 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strStatus,"1"
							wait Wait5	
							.webTable("Users").assertDelValue strStatus1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("Status_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strStatus1,"1"
							wait Wait5
							
							
'For Allalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webList("Status").selectItem strStatus1
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("Status_Filter").assertExist "True"
							
							.webElement("Status_Filter").assertText  "Status = "& strStatus1 
							
							
							.webElement("Status_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
						
														
							.webTable("Users").assertValue strStatus1,"1"
							.webTable("Users").assertDelValue  strStatus
							wait Wait5
							
							.webElement("Status_Filter").press
							
							wait Wait5
							'.webLink("ClearAll").press
							
							'.webLink("ClearAll").assertExist "False"
							.webElement("Status_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strStatus,"1"
							
							.webTable("Users").assertValue strStatus1,"1"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateStatus", "AAA_ATH_TC_003"

