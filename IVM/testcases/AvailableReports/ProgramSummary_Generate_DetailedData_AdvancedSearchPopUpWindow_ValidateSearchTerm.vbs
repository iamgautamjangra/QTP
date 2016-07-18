'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search term filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_PSR_TC_050"



strComments=testcasedata.getvalue("strComments")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
SearchTermBlank=testcasedata.getvalue("SearchTermBlank")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_PROGRAMSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10
						 
						.webLink("AdvancedSearch").press
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait8
						
						
							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							
							If status=False Then
							
								Browser("SeaChangeManagementConsole").Refresh
								wait wait8
								.webLink("AdvancedSearch").press
								 wait Wait8
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								wait wait8
							End if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1
						
						wait Wait5
							
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_PS").assertExist "True"
							
							.webLink("AdvancedSearch").press
							  wait Wait5
														
							
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
												
							
							.webTable("DetailedData_PS").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertExist "True"
							.webElement("SearchTerm_filterDetail").assertStatus "Visible"
							
								.webTable("DetailedData_PS").searchData NoRecordFound_msg											
					       
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
												
							
							.webTable("DetailedData_PS").assertExist "True"
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
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_PSR_TC_050"
