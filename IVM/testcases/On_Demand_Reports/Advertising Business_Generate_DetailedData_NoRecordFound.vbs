'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_NoRecordFound
' Description					:	Validate the message displayed in the table in case of no data. 
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_NoRecordFound", "REP_PSR_TC_058"
strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait15

With ivm.page(report_page)

						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						
						.webEdit("PastNoOfHours").setValue strHours
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Cancel").press
						wait Wait5
		
						.webTable("OnDemandReport").assertExist "True"
						
						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_ODR").assertExist "True"
							.webTable("DetailedData_ODR").assertValue NO_RECORD_FOUND,1
							wait Wait5
						
							.webLink("BackToPreviousPage").press
							wait Wait10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_NoRecordFound", "REP_PSR_TC_058"