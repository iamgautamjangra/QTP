'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_ValidateBacktopreviouspageLink
' Description					:	Validate the "<Back To Previous Page" link on the Report.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_ValidateBacktopreviouspageLink", "REP_CSR_TC_011"

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA


With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
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
						
						
						.webButton("Generate").press
						wait Wait5
End with 

With ivm.page(PreferredData_page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait Wait7
End With

With ivm.page(report_page)
							
						
						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webtable("DataSet_Header").assertExist "True"
							
						.weblink("BackToPreviousPage").press
						wait Wait5
							
						.webTable("AvailableReports").assertExist "True"
					
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_ValidateBacktopreviouspageLink", "REP_CSR_TC_011"