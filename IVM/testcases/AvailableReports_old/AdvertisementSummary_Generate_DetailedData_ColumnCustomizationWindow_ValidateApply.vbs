'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7
						
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
							
							
							.webTable("DetailedData_Header_AS").pressColumnCustomization
							wait Wait5
							
							
							.selectCustomizeColumn "Clock Number","False"
							'.selectCustomizeColumn "Campaign Name","False"
							'.selectCustomizeColumn "Program Provider","False"
							.selectCustomizeColumn "Ad Slot Position","False"
							.selectCustomizeColumn "Ad Title","False"
							.selectCustomizeColumn "Ad Break","False"
							.selectCustomizeColumn "Unique Customers","False"
							.selectCustomizeColumn "Advert Placements","False"
							.selectCustomizeColumn "Advert Full Views","False"
							.selectCustomizeColumn "Advert Partial Views","False"
							.selectCustomizeColumn "Advert Fast Forward Views","False"
							.selectCustomizeColumn "Advert Placements Not Viewed","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							.selectCustomizeColumn "Total Home Views","False"
							.selectCustomizeColumn "Advert Average Play Time","False"
							'.selectCustomizeColumn "Total Ad Views","False"
							
						
							.webLink("CustomizeApply").press
							wait Wait5
							
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Clock Number","False"
							'.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Campaign Name","False"
							'.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Program Provider","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Ad Slot Position","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Ad Title","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Ad Break","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Unique Customers","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Placements","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Full Views","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Partial Views","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Fast Forward Views","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Placements Not Viewed","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Average Play Time","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Total Home Views","False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Advert Average Play Time","False"
							'.webTable("DetailedData_Header_AS").assertCustomizeColumnExist "Total Ad Views","False"
							
							.webTable("DetailedData_Header_AS").pressColumnCustomization
							wait Wait5
							.selectCustomizeColumn strColumn,"True"
							.selectCustomizeColumn strColumn1,"True"
							.webLink("CustomizeApply").press
							wait Wait10
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist strColumn,"False"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist strColumn1,"False"
														
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_CSR_TC_047"