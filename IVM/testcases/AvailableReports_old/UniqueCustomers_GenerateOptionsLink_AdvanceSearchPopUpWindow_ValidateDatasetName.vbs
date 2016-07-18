'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
strDataSetName=testcasedata.getvalue("strDataSetName")
strDataSetName1=testcasedata.getvalue("strDataSetName1")
strDataSetNameInv=testcasedata.getvalue("strDataSetNameInv")
wait Wait10
DataSet=DATASET_UNIQUECUSTOMERS

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
							wait Wait10

	'---------------Assert Back to previous webLink-----------------------
							.webLink("AdvancedSearch").press
							wait Wait2
							
							
						
							.webEdit("DataSetName").setValue strDataSetName
							
							.webLink("AdvSearch").press
							wait Wait5
							
							
							wait Wait10
							.webElement("DataSetName_Filter").assertExist "True"
							If len(strDataSetName)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDataSetName,1,8) &".." &"   X"
							
							Else
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDataSetName &"   X"
								
							End If
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
								
							
							.webTable("DataSet").assertValue strDataSetName,"1"
							wait Wait5	
							.webTable("DataSet").assertDelValue strDataSetName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DataSet").assertValue strDataSetName1,"1"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DataSetName").setValue strDataSetNameInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("DataSetName_Filter").assertExist "True"
							If len(strDataSetNameInv)>9 then 
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& mid(strDataSetNameInv,1,8) &".." &"   X"
							
							Else
							.webElement("DataSetName_Filter").assertText  "Dataset Name ="& strDataSetNameInv &"   X"
							End If
							
							.webElement("DataSetName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DataSet").assertExist "True"
						
							.webTable("DataSet").searchData NoDatsetFound_msg
							
							.webTable("DataSet").assertDelValue strDataSetName
							.webTable("DataSet").assertDelValue strDataSetName1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DataSetName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DataSet").assertValue strDataSetName,"1"
							
							.webTable("DataSet").assertValue strDataSetName1,"1"
							
							.webTable("DataSet").assertDelValue NoDatsetFound_msg
							
			
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_GenerateOptionsLink_AdvanceSearchPopUpWindow_ValidateDatasetName", "REP_RSR_TC_006"			
