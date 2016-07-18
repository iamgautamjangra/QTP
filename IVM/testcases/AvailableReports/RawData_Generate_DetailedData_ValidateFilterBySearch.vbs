'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateFilterBySearch", "REP_RDR_TC_032"


strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
						 wait Wait10
						.webLink("AdvancedSearch").press
						wait Wait3
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
						wait Wait7
				
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_RD").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").assertValue NoRecordFound_msg,1
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_RD").assertExist "True"
							.webLink("Search_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("Search_RD").press							
							 wait Wait5
							
							.webLink("Search_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData_RD").assertExist "True"													
					        .webTable("DetailedData_RD").searchData strSearchValid
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_RD").assertExist "True"
							.webLink("Search_RD").assertStatus "Visible"
							
							.webLink("ClearAll_RD").assertExist "True"
							.webLink("ClearAll_RD").assertStatus "Visible"
							
							.webLink("Search_RD").press							
							 wait Wait5
							
							.webLink("Search_RD").assertExist "False"
							.webLink("ClearAll_RD").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateFilterBySearch", "REP_RDR_TC_032"
