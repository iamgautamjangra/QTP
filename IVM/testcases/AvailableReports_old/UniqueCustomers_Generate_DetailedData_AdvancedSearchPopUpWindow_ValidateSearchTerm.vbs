'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search term filter using advanced search.
' Author 						:   SeaChange
' Date 							:   04-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_UCR_TC_026"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strComments=testcasedata.getvalue("strComments")
strSearchTermInValid=testcasedata.getvalue("strSearchTermInValid")
strSearchTermValid=testcasedata.getvalue("strSearchTermValid")


DataSet=DATASET_UNIQUECUSTOMERS

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
						 wait Wait10
						 
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
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
							.webTable("DetailedData_UC").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "visible"
							
							.webEdit("SearchTerm_Adv").setValue strSearchTermInValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").assertValue NoRecordFound_msg,1
							wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "True"
							If len(strSearchTermInValid)>9 then 
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& mid(strSearchTermInValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& strSearchTermInValid &"   X"
							End If
							
							.webElement("SearchTerm_Filter").assertExist "True"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							.webLink("ClearAll").press
							
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm_Adv").setValue strSearchTermValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").searchData strSearchTermValid
							wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "True"
							If len(strSearchTermValid)>9 then 
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& mid(strSearchTermValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& strSearchTermValid &"   X"
							End If
							
							.webElement("SearchTerm_Filter").assertExist "True"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							.webLink("ClearAll").press
							wait Wait5							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_UCR_TC_026"
