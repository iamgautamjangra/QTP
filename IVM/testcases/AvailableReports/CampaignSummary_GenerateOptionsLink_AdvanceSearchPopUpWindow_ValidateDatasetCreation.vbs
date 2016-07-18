'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDetasetCreation=testcasedata.getvalue("strDetasetCreation")
strDetasetCreation1=testcasedata.getvalue("strDetasetCreation1")
strDetasetCreationInv=testcasedata.getvalue("strDetasetCreationInv")
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait Wait2
						
						
					
						.webEdit("DetasetCreation").setValue strDatSetName
						
						.webLink("AdvancedSearch").press
						wait Wait5
						.webElement("DetasetCreation_Filter").assertExist "True"
						If len(strDatSetName)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& mid(strDatSetName,1,10) &".." &"   X"
							
						Else
						.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& strDatSetName &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webTable("DataSet").assertValue strDatSetName,"2"
							wait Wait5	
							.webTable("DataSet").assertDelValue strDatSetName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DataSet").assertValue strDatSetName1,"2"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DetasetCreation_Adv").setValue strDetasetCreationInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							If len(strDetasetCreationInv)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& mid(strDetasetCreationInv,1,10) &".." &"   X"
							
							Else
							.webElement("DetasetCreation_Filter").assertText  "Dataset Creation ="& strDetasetCreationInv &"   X"
							End If
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoRecordFound_msg
							
							.webTable("DataSet").assertDelValue strDetasetCreation
							.webTable("DataSet").assertDelValue strDetasetCreation1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DetasetCreation_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DataSet").assertValue strDetasetCreation,"2"
							
							.webTable("DataSet").assertValue strDetasetCreation1,"2"
							
							.webTable("DataSet").assertDelValue NoRecordFound_msg
							
			
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"			
