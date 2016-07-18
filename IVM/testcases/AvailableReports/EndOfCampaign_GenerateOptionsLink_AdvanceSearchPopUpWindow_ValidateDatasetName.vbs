'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDatSetName=testcasedata.getvalue("strDatSetName")
strDatSetName1=testcasedata.getvalue("strDatSetName1")
strDatSetNameInv=testcasedata.getvalue("strDatSetNameInv")
wait Wait10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait Wait2
						
						
					strDatSetName=testcasedata.getvalue("strDatSetName")
						.webEdit("DataSetName").setValue strDatSetName
						
						.webLink("AdvSearch").press
						wait Wait5
						.webElement("DataSetName_Filter").assertExist "True"
						If len(strDatSetName)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDatSetName,1,8) &".." &"   X"
							
						Else
						
						.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDatSetName &"   X"
						End If	
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							wait Wait5	
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DataSetName").setValue strDatSetNameInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							
							.webElement("DataSetName_Filter").assertExist "True"
							If len(strDatSetNameInv)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDatSetNameInv,1,8) &".." &"   X"
							
							Else
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDatSetNameInv &"   X"
							End If
							
							.webElement("DataSetName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoDatsetFound_msg
							
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							
End with										         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"			
