'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser", "REP_RSR_TC_006"

'ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strUser=testcasedata.getvalue("strUser")
strUser1=testcasedata.getvalue("strUser1")
strUserInv=testcasedata.getvalue("strUserInv")
wait Wait10

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
'DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------

						.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("User").setValue strUser
								.webLink("AdvSearch").press
								 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("User").setValue strUser
							.webLink("AdvSearch").press
							wait wait8
						end if

						.webElement("User_Filter").assertExist "True"
						If len(strUser)>9 then 
							.webElement("User_Filter").assertText  "User ="& mid(strUser,1,8) &".." &"   X"
							
						Else
						.webElement("User_Filter").assertText  "User ="& strUser &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webTable("DataSet").assertValue strUser,"3"
							wait Wait5	
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							wait Wait5
							
							
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
														
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("User_Filter").assertExist "False"
							
										
End with						         						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateUser", "REP_RSR_TC_006"			
