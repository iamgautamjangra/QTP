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
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait Wait10	
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3
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
							
							
							.webTable("DetailedData_Header_RS").pressColumnCustomization
							wait Wait5
							
							
							.selectCustomizeColumn "Clock Number","False"
							REM .selectCustomizeColumn "Unique Customers","False"
							.selectCustomizeColumn "Advert Placement Count","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Region Group Name","False"
						
							
							.webLink("CustomizeApply").press
							wait Wait10
							
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Clock Number","False"
							REM .webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Unique Customers","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Placement Count","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist "Region Group Name","False"
							
							.webTable("DetailedData_Header_RS").pressColumnCustomization
							wait Wait5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait Wait10
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_Header_RS").assertCustomizeColumnExist strColumn1,"True"
														
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"