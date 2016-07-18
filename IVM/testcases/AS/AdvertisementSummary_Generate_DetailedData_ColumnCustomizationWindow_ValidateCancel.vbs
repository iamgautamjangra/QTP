'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel
' Description					:	Validate cancel operation for "Customize Columns" pop up. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"

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
						 wait Wait5	
						 
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
						wait Wait5
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
							
							.webTable("DetailedData_Header_AS").assertExist "True"
							.webTable("DetailedData_Header_AS").pressColumnCustomization 
							wait Wait3
																										
					        .selectCustomizeColumn strColumn,"False"
							.selectCustomizeColumn strColumn1,"False"
							

							.webLink("CustomizeCancel").press
							wait Wait5
							
							.webTable("DetailedData_AS").assertExist "True"
'Displayed columns							
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_Header_AS").assertCustomizeColumnExist strColumn1,"True"
							

						
End with



'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"