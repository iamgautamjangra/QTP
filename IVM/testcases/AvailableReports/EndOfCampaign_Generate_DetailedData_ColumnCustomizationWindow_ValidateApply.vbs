'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
						
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							
							
							.webTable("DetailedData_Header_EOC").pressColumnCustomization
							wait Wait5
							
							
							.selectCustomizeColumn "Clock Number","False"
							.selectCustomizeColumn "Unique Customers","False"
							.selectCustomizeColumn "Advert Placement Count","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Total Ad Views","False"
						
							
							.webLink("CustomizeApply").press
							wait Wait10
							
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Clock Number","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Unique Customers","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Placement Count","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist "Total Ad Views","False"
							
							.webTable("DetailedData_Header_EOC").pressColumnCustomization
							wait Wait5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait Wait10
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist strColumn1,"False"
														
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"