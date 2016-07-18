'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_DetailedData_NoRecordFound
' Description					:	Validate the message displayed in the table in case of no data. 
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_NoRecordFound", "REP_ADR_TC_039"

strSeachValue=testcasedata.getvalue("strSeachValue")
strStart=testcasedata.getvalue("strStart")
strEnd=testcasedata.getvalue("strEnd")
REM strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
DataSet=testcasedata.getvalue("DataSet")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
'DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
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
	

						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData").assertExist "True"
														
							.assertExistWE NoRecordFound_msg,"True"
							.webLink("BackToPreviousPage").press
							wait Wait10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_NoRecordFound", "REP_ADR_TC_039"