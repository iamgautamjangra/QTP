'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_GenerateOptionsLink_ValidateFilterBySearch
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_GenerateOptionsLink_ValidateFilterBySearch", "REP_RSR_TC_007"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait5

 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						wait Wait10

'for Invalid Search
														
							.webEdit("SearchTerm").setValue strSearchInvalid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							.webTable("DataSet").assertExist "True"													
					        .webTable("DataSet").assertValue NoDatsetFound_msg,1
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertStatus "Visible"
							
													
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("ClearAll").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"

'for Valid Search
							.webEdit("SearchTerm").setValue strSearchValid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							.webTable("DataSet").assertExist "True"													
					        .webTable("DataSet").searchData strSearchValid
							wait Wait5
							
							'.webTable("SearchCriteria_APD").assertExist "True"
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webElement("SearchTerm_Filter").assertExist "True"
							.webElement("SearchTerm_Filter").assertStatus "Visible"
							
													
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webLink("ClearAll").press							
							 wait Wait5
							
							.webElement("SearchTerm_Filter").assertExist "False"
							.webLink("ClearAll").assertExist "False"
						
					       .webLink("BackToPreviousPage").press
						    wait Wait10
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_GenerateOptionsLink_ValidateFilterBySearch", "REP_RSR_TC_007"			