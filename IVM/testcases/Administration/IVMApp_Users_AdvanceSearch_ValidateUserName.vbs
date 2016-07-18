'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File UserName				    :	IVMApp_Users_AdvanceSearch_ValidateUserName
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2022
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateUserName", "AAA_ATH_TC_003"
	

'Validate labels

REM ivm.NavigateToMenu MENU_USERS
REM wait Wait5
strUserName=testcasedata.getvalue("strUserName")
strUserName2=testcasedata.getvalue("strUserName2")
strUserNameInv=testcasedata.getvalue("strUserNameInv")

with ivm.page(User_page)
                            .webLink("AdvancedSearch").press
							wait Wait5
							.webEdit("UserName").setValue strUserName
						   
							.webLink("AdvSearch").press
							wait 3
							.webElement("UserName_Filter").assertExist "True"
							.webElement("UserName_Filter").assertText  "User Name = "& strUserName 
						
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
							
						
							.webTable("Users").assertValue strUserName,"2"
							wait Wait5	
							.webTable("Users").assertDelValue strUserName2
							.webLink("ClearAll").press
							wait Wait5
							.webElement("UserName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("Users").assertValue strUserName2,"2"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("UserName").setValue strUserNameInv
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("UserName_Filter").assertExist "True"
							
							.webElement("UserName_Filter").assertText  "User Name = "& strUserNameInv 
							
							
							.webElement("UserName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("Users").assertExist "True"
						
							.webTable("Users").searchData "The search result is empty."
							
							.webTable("Users").assertDelValue strUserName
							.webTable("Users").assertDelValue strUserName2
							wait Wait5
							
							.webElement("UserName_Filter").press
							
							wait Wait5
							'.webLink("ClearAll").press
							
							'.webLink("ClearAll").assertExist "False"
							.webElement("UserName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("Users").assertValue strUserName,"2"
							
							.webTable("Users").assertValue strUserName2,"2"
							
							.webTable("Users").assertDelValue "The search result is empty."
							
						
End With
 
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_AdvanceSearch_ValidateUserName", "AAA_ATH_TC_003"

