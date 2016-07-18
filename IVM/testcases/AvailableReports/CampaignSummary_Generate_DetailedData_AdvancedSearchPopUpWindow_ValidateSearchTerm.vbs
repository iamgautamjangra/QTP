'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_040"


strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
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

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").assertValue NoRecordFound_msg,1
							wait Wait5
							
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertStatus "Visible"
							.webElement("SearchTerm_Filter").assertValue "Search Term =" & strSearchInvalid & " x"
							
							.webLink("SearchTerm_Filter").assertExist "True"
							.webLink("SearchTerm_Filter").assertStatus "Visible"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("SearchTerm_Filter").press							
							 wait Wait5
							
							.webLink("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData").searchData strSearchValid
							.webTable("DetailedData").assertDelValue NoRecordFound_msg
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").searchData strSearchValid
							wait Wait5
							
						
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							.webElement("SearchTerm_Filter").assertValue "Search Term =" & strSearchValid & " x"
							.webLink("SearchTerm_Filter").assertExist "True"
							.webLink("SearchTerm_Filter").assertStatus "Visible"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("SearchTerm_Filter").press							
							 wait Wait5
							
							.webLink("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData").searchData strSearchValid
							.webTable("DetailedData").assertDelValue NoRecordFound_msg

							.webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_040"
