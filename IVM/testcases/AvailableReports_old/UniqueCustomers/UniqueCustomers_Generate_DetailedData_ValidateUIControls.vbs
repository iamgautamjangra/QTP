'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_ValidateUIControls", "REP_UCR_TC_020"


DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	
With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait 5
						
											
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webLink("Actions").press
						.webLink("ExportToCSV").assertExist "True"
						.webLink("ExportToCSV").assertStatus "Visible"
						
						.webLink("ExportToXLS").assertExist "True"
						.webLink("ExportToXLS").assertStatus "Visible"
						
						.webLink("ExportToPDF").assertExist "False"
						
						.webTable("DetailedData_UC").assertExist "True"
						.webTable("DetailedData_Header_UC").assertExist "True"
						
						.webTable("DetailedData_Header_UC").assertColumnExist "Time Range", "True"						
										
						.webTable("DetailedData_Header_UC").assertColumnExist "Unique Customers", "True"
						
		
						
						
End with


'End Test CRDe
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_Generate_DetailedData_ValidateUIControls", "REP_UCR_TC_020"