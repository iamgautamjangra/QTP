'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch
' Description					:	Validate the search available in customised column window.
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")


DataSet=DATASET_PROGRAMSUMMARY
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
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
		
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
							
							.webTable("DetailedData_Header_PS").assertExist "True"
							.webTable("DetailedData_Header_PS").pressColumnCustomization
							.webedit("CustomizeSearch").assertExist "True"
					        .webedit("CustomizeSearch").assertStatus "Visible"
							.webEdit("CustomizeSearch").assertValue "Search..."
					         wait Wait5
							
						    .webEdit("CustomizeSearch").setValue strColumn					
						     wait Wait2
							.assertExistWE strColumn,"True"
							.selectCustomizeColumn strColumn,"False"
							
							
							.selectCustomizeColumn strColumn,"True"
							
							
							.webImage("CustomizeSearchClear").press
							.assertExistWE strColumn1,"True"
							.selectCustomizeColumn strColumn1,"False"
							.selectCustomizeColumn strColumn1,"True"
							
							
End with


'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"