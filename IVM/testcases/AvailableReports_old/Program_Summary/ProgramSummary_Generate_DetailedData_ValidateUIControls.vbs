'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_ValidateUIControls", "REP_PSR_TC_037"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
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
						
						.webTable("DetailedData_Header_PS").assertExist "True"
						
						.webTable("DetailedData_PS").assertExist "True"
				
						.webTable("DetailedData_Header_PS").assertColumnExist "Time Range", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Program PAID", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Program Title", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Program Series Title", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Advert Placements", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Advert Fasr Forward Views", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Advert Placements Not Viewed", "True"
											
						.webTable("DetailedData_Header_PS").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_PS").assertColumnExist "Total Ad Views", "True"
						
End with



'End Test CRDe
executionController.stopTestCase_w_TestCRDeNumber "ProgramSummary_Generate_DetailedData_ValidateUIControls", "REP_PSR_TC_037"