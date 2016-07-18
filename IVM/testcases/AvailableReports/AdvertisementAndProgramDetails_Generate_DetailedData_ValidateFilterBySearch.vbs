'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_APD_TC_025"

strSeachValue=testcasedata.getvalue("strSeachValue")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

DataSet=DATASET_ADPROGRAMDETAILS
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
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
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
							End If
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait10

							
							.webEdit("Comments").setValue strComments
							.webButton("Generate").press
							wait Wait10
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_APD").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "visible"
							
							.webEdit("SearchTerm").setValue strSearchInvalid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							.webTable("DetailedData_APD").assertExist "True"													
					        .webTable("DetailedData_APD").assertValue NoRecordFound_msg,1
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
							
'Search with valid data
							.webEdit("SearchTerm").setValue strSearchValid
							wait Wait5
							.webButton("Go").press
							wait Wait5
							
							.webTable("DetailedData_APD").assertExist "True"													
					        .webTable("DetailedData_APD").searchData strSearchValid
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

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateFilterBySearch", "REP_APD_TC_025"
