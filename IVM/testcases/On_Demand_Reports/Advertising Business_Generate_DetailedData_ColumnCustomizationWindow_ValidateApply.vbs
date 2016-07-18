'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"


strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait7

With ivm.page(report_page)

						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						 
						.webEdit("PastNoOfHours").setValue strHours
									
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
							
							.webTable("DetailedData_Header_ODR").assertExist "True"
							.webTable("DetailedData_Header_ODR").pressColumnCustomization
							.webEdit("CustomizeSearch").assertExist "True"
					        .webEdit("CustomizeSearch").assertStatus "Visible"
					         wait Wait5
																										
					        .selectCustomizeColumn strColumn,"False"
							wait Wait2
							.selectCustomizeColumn strColumn1,"False"
							wait Wait2

							.webLink("CustomizeCancel").press
							wait Wait5
							
							.webTable("DetailedData_ODR").assertExist "True"
'Displayed columns		
							.webTable("DetailedData_Header_ODR").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_ODR").assertCustomizeColumnExist strColumn1,"False"
							

						
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"