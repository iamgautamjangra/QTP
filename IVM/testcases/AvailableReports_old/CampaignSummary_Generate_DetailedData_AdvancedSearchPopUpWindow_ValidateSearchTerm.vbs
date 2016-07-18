'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the search functionality for the "Detailed Data" table.
' Author 						:   SeaChange
' Date 							:   12-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_040"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")
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
						   
					     .selectListItem MULTI_LIST_TimeRange,strTimeRange,"True"
						wait Wait2
						.selectListItem MULTI_LIST_TimeRange,strTimeRange1,"True"
						wait Wait2
																	
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
						wait Wait3						
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
							
							.webTable("SearchCriteria").assertExist "True"
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
							
							.webTable("DetailedData").searchData SearchTermValid
							.webTable("DetailedData").assertDelValue NoRecordFound_msg
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").searchData SearchTermValid
							wait Wait5
							
							.webTable("SearchCriteria_CS").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							.webElement("SearchTerm_Filter").assertValue "Search Term =" & SearchTermValid & " x"
							.webLink("SearchTerm_Filter").assertExist "True"
							.webLink("SearchTerm_Filter").assertStatus "Visible"
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("SearchTerm_Filter").press							
							 wait Wait5
							
							.webLink("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData").searchData SearchTermValid
							.webTable("DetailedData").assertDelValue NoRecordFound_msg

'Search with blank data							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							
							.webEdit("SearchTerm").setValue strSearchBlank
							.webLink("AdvSearch").press
							 wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        wait Wait5
							
							.webTable("SearchCriteria").assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
							.webLink("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_CSR_TC_040"
