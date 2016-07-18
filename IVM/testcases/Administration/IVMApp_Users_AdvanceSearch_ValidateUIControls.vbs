'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_AdvanceSearch_ValidateUIControls
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateUIControls", "AAA_ATH_TC_003"
	

'Validate labels

ivm.NavigateToMenu MENU_USERS
wait 10
with ivm.page(User_page)
                     
                     .webLink("AdvancedSearch").press
'Validate UI
                     .webElement("AdvSearchTerm").assertStatus "Visible"
                     .webElement("AdvSearchTerm").assertExist "True"
                     .webEdit("AdvSearchTerm").assertStatus "Visible"
                     .webEdit("AdvSearchTerm").assertExist "True"

                     .webElement("AdvUserName").assertStatus "Visible"
                     .webElement("AdvUserName").assertExist "True"
                     .webEdit("UserName").assertStatus "Visible"
                     .webEdit("UserName").assertExist "True"
					 
					 .webElement("Status").assertStatus "Visible"
                     .webElement("Status").assertExist "True"
                     .webList("Status").assertStatus "Visible"
                     .webList("Status").assertSelectedItem "All"
					 
					 .webElement("Role").assertStatus "Visible"
                     .webElement("Role").assertExist "True"
                     .webEdit("Role").assertStatus "Visible"
                     .webEdit("Role").assertExist "True"
					 
					 .webElement("LastLogIn").assertStatus "Visible"
                     .webElement("LastLogIn").assertExist "True"
                     .webEdit("LastLogIn").assertStatus "Visible"
                     .webEdit("LastLogIn").assertExist "True"
                     .webImage("LastLogIn").assertStatus "Visible"
                     .webImage("LastLogIn").assertExist "True"


                     .webElement("LastUpdated").assertStatus "Visible"
                     .webElement("LastUpdated").assertExist "True"
                     .webEdit("LastUpdated").assertStatus "Visible"
                     .webEdit("LastUpdated").assertExist "True"
                     .webImage("LastUpdated").assertStatus "Visible"
                     .webImage("LastUpdated").assertExist "True"
					 
                  
                    

                     .webLink("AdvSearch").assertStatus "Visible"
                     .webLink("AdvSearch").assertExist "True"

                     .webLink("AdvCancel").assertStatus "Visible"
                     .webLink("AdvCancel").assertExist "True"

                     .webLink("AdvClearAll").assertStatus "Visible"
                     .webLink("AdvClearAll").assertExist "True"
                     .webLink("AdvClearAll").press
					 .webLink("AdvCancel").press
					 wait Wait5
End With					 
'=============================================================================================
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateUIControls", "AAA_ATH_TC_003"

