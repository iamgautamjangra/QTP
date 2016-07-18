'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_ValidateBacktopreviouspageLink
' Description					:	Validate the operation of  "<Back To Previous Page" link on the Report.
' Author 						:   SeaChange
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_ValidateBacktopreviouspageLink", "REP_EOC_TC_021"


'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait wait10
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
						wait Wait7
						

						
						.webEdit("EmailRecipients").setValue strEmail
					
						.webList("ReportFormat").selectItem strReportFormat
			
						.webList("DataType").selectItem strDataType
								
										
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait5
End with 

With ivm.page(PreferredData_Page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").press
						 wait Wait5	
End With

With ivm.page(report_page)
							
						.webElement("GenerateReport").assertExist "True"
						.webElement("GenerateReport").assertStatus "Visible"
						.webElement("GenerateReport").assertText "Generate "& reportEndOfCampaign & " Report"
						
							
						.weblink("BackToPreviousPage").press
						wait Wait5
							
						.webTable("AvailableReports").assertExist "True"
					
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_ValidateBacktopreviouspageLink", "REP_EOC_TC_021"