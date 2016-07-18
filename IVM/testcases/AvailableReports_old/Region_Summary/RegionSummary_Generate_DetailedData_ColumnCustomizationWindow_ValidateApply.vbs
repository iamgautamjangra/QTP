'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
							
							
							.webTable("DetailedData_Header_RS").pressColumnCustomization
							wait 5
							
							
							.selectCustomizeColumn "Clock Number","False"
							.selectCustomizeColumn "Unique Customers","False"
							.selectCustomizeColumn "Advert Placements","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Total Ad Views","False"
						
							
							.webLink("CustomizeApply").press
							wait 10
							
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Clock Number","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Unique Customers","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Placements","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Total Ad Views","False"
							
							.webTable("DetailedData_Header_RS").pressColumnCustomization
							wait 5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait 10
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist strColumn1,"False"
														
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"