'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch
' Description					:	Validate the search available in customised column window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"

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
							
						    .webEdit("CustomizeSearch").setValue strColumn					
						     wait Wait2												
							
							.webImage("CustomizeSearchClear").press
							.assertExistWE strColumn1,"True"
							.selectCustomizeColumn strColumn1,"False"
							.selectCustomizeColumn strColumn1,"True"
							
							
End with


'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_CSR_TC_045"