'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	APD_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "APD_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDetasetCreation=testcasedata.getvalue("strDetasetCreation")
strDetasetCreation1=testcasedata.getvalue("strDetasetCreation1")
strDetasetCreationInv=testcasedata.getvalue("strDetasetCreationInv")
wait 10


with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						wait 10

'---------------Assert Back to previous webLink-----------------------
						.webLink("AdvancedSearch").press
						wait 2
						
						
					
						.webEdit("DetasetCreation").setValue strDatSetName
						
						.webLink("AdvancedSearch").press
						wait 5
						.webElement("DetasetCreation_Filter").assertExist "True"
						If len(strDatSetName)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Detaset Creation ="& mid(strDatSetName,1,10) &".." &"   X"
							
						Else
						.webElement("DetasetCreation_Filter").assertText  "Detaset Creation ="& strDatSetName &"   X"
							
						End If
						.webLink("ClearAll").assertExist "True"
						.webLink("ClearAll").assertStatus "Visible"
						
						.webTable("DataSet").assertExist "True"
							
						
							.webTable("DataSet").assertValue strDatSetName,"2"
							wait 5	
							.webTable("DataSet").assertDelValue strDatSetName1
							.webLink("ClearAll").press
							wait 5
							.webElement("DatSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DataSet").assertValue strDatSetName1,"2"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("DetasetCreation_Adv").setValue strDetasetCreationInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							If len(strDetasetCreationInv)>9 then 
							.webElement("DetasetCreation_Filter").assertText  "Detaset Creation ="& mid(strDetasetCreationInv,1,10) &".." &"   X"
							
							Else
							.webElement("DetasetCreation_Filter").assertText  "Detaset Creation ="& strDetasetCreationInv &"   X"
							End If
							
							.webElement("DetasetCreation_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoRecordFound_msg
							
							.webTable("DataSet").assertDelValue strDetasetCreation
							.webTable("DataSet").assertDelValue strDetasetCreation1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("DetasetCreation_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DataSet").assertValue strDetasetCreation,"2"
							
							.webTable("DataSet").assertValue strDetasetCreation1,"2"
							
							.webTable("DataSet").assertDelValue NoRecordFound_msg
							
			
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "APD_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetCreation", "REP_RSR_TC_006"			
