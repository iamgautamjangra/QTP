'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm
' Description					:	Validate the Search term filter using advanced search..
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_PSR_TC_031"


strSeachValue=testcasedata.getvalue("strSeachValue")

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_PROGRAMSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						wait Wait5
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

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							 wait Wait5
							 
							.webTable("PreferredData_PS").assertExist "True"
							.webLink("AdvancedSearch").press
							  wait Wait5
														
							
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "visible"
							
							.webEdit("SearchTerm_Adv").setValue strSearchInvalid
							.webLink("AdvSearch").press
							 wait Wait5
							 
							 
							 .webElement("SearchTerm_filter").assertExist "True"
							If len(strSearchInvalid)>9 then 
							.webElement("SearchTerm_filter").assertText  "Search Term ="& mid(strSearchInvalid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filter").assertText  "Search Term ="& strSearchInvalid &"   X"
							
							End If
												
							
							.webTable("PreferredData_PS").assertExist "True"
							.webElement("SearchTerm_filter").assertExist "True"
							.webElement("SearchTerm_filter").assertStatus "Visible"
							
								.webTable("PreferredData_PS").searchData NoRecordFound_msg											
					        
							wait Wait5
							
							.webLink("ClearAll").press
							wait Wait7
														
							.webElement("SearchTerm_filter").assertExist "False"
							
'Search with valid data
							
							.webLink("AdvancedSearch").press					
					        wait Wait3
							.webEdit("SearchTerm_Adv").setValue strSearchValid
							.webLink("AdvSearch").press
							 wait Wait5
							
							 .webElement("SearchTerm_filter").assertExist "True"
							If len(strSearchValid)>9 then 
							.webElement("SearchTerm_filter").assertText  "Search Term ="& mid(strSearchValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filter").assertText  "Search Term ="& strSearchValid &"   X"
							
							End If
												
							
							.webTable("PreferredData_PS").assertExist "True"
							.webElement("SearchTerm_filter").assertExist "True"
							.webElement("SearchTerm_filter").assertStatus "Visible"
												
							
							.webLink("ClearAll").press
							wait Wait2
							
							.webElement("SearchTerm_filter").assertExist "False"

							.webLink("BackToPreviousPage").press
							wait wait2

End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateSearchTerm", "REP_PSR_TC_0ss31"
