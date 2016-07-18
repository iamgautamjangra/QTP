'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch", "REP_ASR_TC_039"
strSeachValue=testcasedata.getvalue("strSeachValue")

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")


DataSet=DATASET_ADSUMMARY
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(DetailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData_AS").assertExist "True"
							.webEdit("FillterBySearch").assertExist "True"
							.webEdit("FillterBySearch").assertStatus "visible"
							.webEdit("FillterBySearch").press
							.webEdit("FillterBySearch").setValue strSearchInvalid
							wait Wait5
							.webElement("Gobutton").press
							wait Wait5
							
							.webElement("SearchTerm_filter").assertExist "True"
							If len(strSearchInvalid)>9 then 
							.webElement("SearchTerm_filter").assertText  "Search Term ="& mid(strSearchInvalid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filter").assertText  "Search Term ="& strSearchInvalid &"   X"
							
							End If
												
							
							.webTable("DetailedData_AS").assertExist "True"
							.webElement("SearchTerm_filter").assertExist "True"
							.webElement("SearchTerm_filter").assertStatus "Visible"
							
								.webTable("DetailedData_AS").searchData NoRecordFound_msg											
					        
							wait Wait5
							
							.webLink("ClearAll").press
							wait Wait7
							
'Search with valid data		
						
							
							.webEdit("FillterBySearch").setValue strSearchValid
							wait Wait5
							
							.webElement("Gobutton").press
							wait Wait5
							.webElement("SearchTerm_filter").assertExist "True"
							If len(strSearchValid)>9 then 
							.webElement("SearchTerm_filter").assertText  "Search Term ="& mid(strSearchValid,1,8) &".." &"   X"
							
							Else
							.webElement("SearchTerm_filter").assertText  "Search Term ="& strSearchValid &"   X"
							
							End If
												
							
							.webTable("DetailedData_AS").assertExist "True"
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch", "REP_ASR_TC_039"
