'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File LastUpdated				:	IVMApp_Users_AdvanceSearch_ValidateLastUpdate
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateLastUpdate", "AAA_ATH_TC_003"
	

'Validate labels
ivm.NavigateToMenu MENU_USERS
wait Wait5
strLastUpdated=testcasedata.getvalue("strLastUpdated")
strLastUpdated1=testcasedata.getvalue("strLastUpdated1")
strLastUpdatedInv=testcasedata.getvalue("strLastUpdatedInv")

with ivm.page(User_page)

							.webLink("AdvancedSearch").press
							wait 2
							 .selectDate "LastUpdated", strLastUpdated
							 wait 2
							 .webLink("AdvSearch").press
							wait Wait5	
							.webElement("LastUpdated_Filter").assertExist "True"
							.webElement("LastUpdated_Filter").assertText  "Last Updated = "& strLastUpdated 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strLastUpdated,"5"
							wait Wait5	
							.webTable("Users").assertDelValue strLastUpdated1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("LastUpdated_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strLastUpdated1,"5"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
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
							
							.webTable("Users").assertExist "True"
						
							.webTable("Users").searchData "The search result is empty."
							
							.webTable("Users").assertDelValue strLastUpdated
							.webTable("Users").assertDelValue strLastUpdated1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("LastUpdated_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strLastUpdated,"5"
							
							.webTable("Users").assertValue strLastUpdated1,"5"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateLastUpdate", "AAA_ATH_TC_003"