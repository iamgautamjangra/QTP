'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   SeaChange
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RDR_TC_040"


strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait Wait10
					   .webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
						end if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait10
													
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_RD").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
																				
							
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "visible"
							
							.webEdit("SearchTerm_Adv").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait Wait5
							 
							 
							 .webElement("SearchTerm_filterDetail").assertExist "True"
							If len(strSearchInvalid)>9 then 
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& mid(strSearchInvalid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& strSearchInvalid &"   X"
							
							End If
												
							
							.webTable("DetailedData_RD").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertStatus "Visible"
							
								.webTable("DetailedData_RD").searchData NoRecordFound_msg											
					        
							wait Wait5
							
							.webLink("ClearAll").press
							wait Wait7
														
							.webElement("SearchTerm_filterDetail").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm_Adv").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							 .webElement("SearchTerm_filterDetail").assertExist "True"
							If len(strSearchValid)>9 then 
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& mid(strSearchValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filterDetail").assertText  "Search Term ="& strSearchValid &"   X"
							
							End If
												
							
							.webTable("DetailedData_RD").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertStatus "Visible"
												
							
							.webLink("ClearAll").press
							wait Wait2
							
							.webElement("SearchTerm_filterDetail").assertExist "False"

							.webLink("BackToPreviousPage").press
							wait wait2

End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_RDR_TC_040"
