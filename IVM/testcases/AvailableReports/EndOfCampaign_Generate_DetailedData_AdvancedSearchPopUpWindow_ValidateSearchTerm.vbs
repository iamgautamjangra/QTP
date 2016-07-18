'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search Term filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case

executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm","REP_CSR_TC_033"


'DDataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strSearchTerm=testcasedata.getvalue("strSearchTerm")
strSearchTermInv=testcasedata.getvalue("strSearchTermInv")

DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
						.webButton("Generate").press
						wait Wait10
End with 

With ivm.page(DetailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							
							.webEdit("SearchTerm").setValue strSearchTerm
						   
							.webLink("AdvSearch").press
							.webElement("SearchTerm_Filter").assertExist "True"
							If len(strSearchTerm)>9 then 
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& mid(strSearchTerm,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_Filter").assertText  "Search Term ="& strSearchTerm &"   X"
							
							End If
							
							webTable("DetailedData_EOC").searchData strSearchTerm	
							
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_EOC").assertExist "True"
							
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("SearchTerm_Filter").assertExist "False"
							
						
												
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("SearchTerm").setValue strSearchTermInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							.webTable("DetailedData_EOC").assertExist "True"													
					        .webTable("DetailedData_EOC").assertValue NoRecordFound_msg,1
							wait Wait5
							

							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("SearchTerm_EOC").assertExist "True"
							.webLink("SearchTerm_EOC").assertStatus "Visible"
							
							.webLink("ClearAll_EOC").assertExist "True"
							.webLink("ClearAll_EOC").assertStatus "Visible"
							
							.webLink("SearchTerm_EOC").press							
							 wait Wait5
							
							.webLink("SearchTerm_EOC").assertExist "False"
							.webLink("ClearAll_EOC").assertExist "False"
											
					        
End with
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateSearchTerm","REP_CSR_TC_033"