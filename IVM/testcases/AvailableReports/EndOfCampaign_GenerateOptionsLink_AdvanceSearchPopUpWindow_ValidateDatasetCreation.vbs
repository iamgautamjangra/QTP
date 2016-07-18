'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"
ivm.page(common_page).weblink("LogOut").press
ivm.logIn

strDetasetCreation=testcasedata.getvalue("strDetasetCreation")
strDetasetCreation1=testcasedata.getvalue("strDetasetCreation1")
strDetasetCreationInv=testcasedata.getvalue("strDetasetCreationInv")
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
						.webLink("AdvancedSearch").press
						wait Wait2
						
						.webElement("DetasetCreation_Filter").assertExist "True"
						If len(strDetasetCreation)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& mid(strDetasetCreation,1,8) &".." &"   X"
							
						Else
						.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& strDetasetCreation &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webTable("DataSet").assertValue strDetasetCreation,"2"
							wait Wait5	
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							wait Wait5
							
							
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
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DetasetCreation_Filter").assertExist "False"
							
						
							
			
End with								  
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"			
