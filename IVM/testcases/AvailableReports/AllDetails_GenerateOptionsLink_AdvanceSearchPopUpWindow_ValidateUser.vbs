'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser", "REP_RSR_TC_006"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strUser=testcasedata.getvalue("strUser")
strUser1=testcasedata.getvalue("strUser1")
strUserInv=testcasedata.getvalue("strUserInv")
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait Wait2
						
						
					
						.webEdit("User").setValue strUser
						
						.webLink("AdvSearch").press
						wait Wait5
						.webElement("User_Filter").assertExist "True"
						If len(strUser)>9 then 
							.webElement("User_Filter").assertText  "User ="& mid(strUser,1,8) &".." &"   X"
							
						Else
						.webElement("User_Filter").assertText  "User ="& strUser &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
						
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("User").setValue strUserInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
						
							.webElement("User_Filter").assertExist "True"
							If len(strUserInv)>9 then 
							.webElement("User_Filter").assertText  "User ="& mid(strUserInv,1,8) &".." &"   X"
							
							Else
							.webElement("User_Filter").assertText  "User ="& strUserInv &"   X"
							End If
							
							.webElement("User_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoDatsetFound_msg
				
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("User_Filter").assertExist "False"
							
				
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser", "REP_RSR_TC_006"			
