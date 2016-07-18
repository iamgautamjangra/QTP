'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Detailed data tab with web service.
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_ValidateWithWebServiceData", "REP_PSR_TC_059"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

ivm.Activatebowser()
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait20
DataSet=DATASET_PROGRAMSUMMARY
         			
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10	
						
						.webLink("AdvancedSearch").press
	      					wait Wait5
						.webEdit("DatasetName").setValue DataSet
						wait 2
						.webLink("AdvSearch").press
						 wait Wait5				
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait7
						
				
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
						
						.webTable("DetailedData_PS").assertTableData reportProgramSummaryDetailed,DataSet
					''''''validate data with DGW
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_ValidateWithWebServiceData", "REP_PSR_TC_059"