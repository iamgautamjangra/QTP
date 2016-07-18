'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_ValidateFilterBySearch", "REP_UCR_TC_023"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

strSeachValue=testcasedata.getvalue("strSeachValue")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
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
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").assertValue NoRecordFound_msg,1
							wait Wait5
							
							'.webTable("SearchCriteria_UC").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertStatus "Visible"
							
													
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("ClearAll").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							REM .webLink("ClearAll").assertExist "False"
							
							
'Search with valid data
							.webEdit("SearchTerm").setValue strSearchValid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							
							.webTable("DetailedData_UC").assertExist "True"													
					        .webTable("DetailedData_UC").searchData strSearchValid
							wait Wait5
							
							'.webTable("SearchCriteria_UC").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertStatus "Visible"
							
													
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("ClearAll").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							REM .webLink("ClearAll").assertExist "False"

					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_ValidateFilterBySearch", "REP_UCR_TC_023"
