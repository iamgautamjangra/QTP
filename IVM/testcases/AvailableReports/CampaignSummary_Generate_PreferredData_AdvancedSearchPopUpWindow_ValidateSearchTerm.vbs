'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Preferred Data" table.
' Author 						:   Fonantrix Solution
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_023"



strComments=testcasedata.getvalue("strComments")
SearchTermInvalid=testcasedata.getvalue("SearchTermInvalid")
SearchTermValid=testcasedata.getvalue("SearchTermValid")

DataSet=DATASET_CAMPAIGNSUMMARY
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait10
					     .webTable("DataSet").presstblRadioBtn DataSet,1
						 wait Wait5

						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(PreferredData_page)

							.weblink("PreferredData").press
							wait Wait4
							.webTable("PreferredData").assertExist "True"
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							
							.webEdit("SearchTerm").asserExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue SearchTermInvalid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").assertValue NO_RECORD_FOUND,1
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& SearchTermInvalid &"   X"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm").setValue SearchTermValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").searchData SearchTermValid
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& SearchTermValid &"   X"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"


							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_023"
