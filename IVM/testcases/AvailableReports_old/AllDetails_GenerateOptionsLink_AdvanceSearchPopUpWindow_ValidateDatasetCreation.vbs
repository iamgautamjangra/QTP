'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDetasetCreation=testcasedata.getvalue("strDetasetCreation")
strDetasetCreation1=testcasedata.getvalue("strDetasetCreation1")
strDetasetCreationInv=testcasedata.getvalue("strDetasetCreationInv")
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						

							.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DetasetCreation").setValue strDetasetCreation
								.webLink("AdvSearch").press
								 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DetasetCreation").setValue strDetasetCreation
							.webLink("AdvSearch").press
							wait wait8
						end if
						
						
						.webElement("DetasetCreation_Filter").assertExist "True"
						If len(strDetasetCreation)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& mid(strDetasetCreation,1,8) &".." &"   X"
							
						Else
						.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& strDetasetCreation &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DetasetCreation_Filter").assertExist "False"
							
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DetasetCreation").setValue strDetasetCreationInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							If len(strDetasetCreationInv)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& mid(strDetasetCreationInv,1,8) &".." &"   X"
							
							Else
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& strDetasetCreationInv &"   X"
							End If
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoDatsetFound_msg
							
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DetasetCreation_Filter").assertExist "False"
							
			
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "AllDetails_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"			
