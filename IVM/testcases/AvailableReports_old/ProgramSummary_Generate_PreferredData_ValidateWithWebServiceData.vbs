'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_Generate_PreferredData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Preferred data tab with web service.
' Author 						:   SeaChange
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_PSR_TC_036"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.Activatebowser()
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
DataSet=DATASET_PROGRAMSUMMARY
          
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10
                       
						.webLink("AdvancedSearch").press
	      					wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						 wait Wait7
                         
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait7
						
				
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
						
							.webTable("PreferredData_PS").assertTableData reportProgramSummaryPreferred,DataSet
				
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_PSR_TC_036"