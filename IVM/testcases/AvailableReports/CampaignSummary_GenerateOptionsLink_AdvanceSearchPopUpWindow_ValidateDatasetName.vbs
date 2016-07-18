'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDatSetName=testcasedata.getvalue("strDatSetName")
strDatSetName1=testcasedata.getvalue("strDatSetName1")
strDatSetNameInv=testcasedata.getvalue("strDatSetNameInv")
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait Wait2
						
						
					
						.webEdit("DataSetName").setValue strDatSetName
						
						.webLink("AdvancedSearch").press
						wait Wait5
						.webElement("DataSetName_Filter").assertExist "True"
						If len(strDatSetName)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDatSetName,1,10) &".." &"   X"
							
						Else
						.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDatSetName &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webTable("DataSet").assertValue strDatSetName,"1"
							wait Wait5	
							.webTable("DataSet").assertDelValue strDatSetName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DataSet").assertValue strDatSetName1,"1"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DataSetName_Adv").setValue strDatSetNameInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("DataSetName_Filter").assertExist "True"
							If len(strDatSetNameInv)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDatSetNameInv,1,10) &".." &"   X"
							
							Else
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDatSetNameInv &"   X"
							End If
							
							.webElement("DataSetName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoRecordFound_msg
							
							.webTable("DataSet").assertDelValue strDatSetName
							.webTable("DataSet").assertDelValue strDatSetName1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DataSet").assertValue strDatSetName,"1"
							
							.webTable("DataSet").assertValue strDatSetName1,"1"
							
							.webTable("DataSet").assertDelValue NoRecordFound_msg
							
			
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"			
