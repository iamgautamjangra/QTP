'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel
' Description					:	Validate cancel operation for "Customize Columns" pop up. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")


DataSet=DATASET_PROGRAMSUMMARY
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
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

						.webLink("DetailedData").press
						wait Wait5
							
							.webTable("DetailedData_Header_PS").assertExist "True"
							.webTable("DetailedData_Header_PS").pressColumnCustomization 
							wait Wait3
																										
					        .selectCustomizeColumn strColumn,"False"
							.selectCustomizeColumn strColumn1,"False"
							

							.webLink("CustomizeCancel").press
							wait Wait5
							
							.webTable("DetailedData_PS").assertExist "True"
'Displayed columns							
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_Header_PS").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_Header_PS").assertCustomizeColumnExist strColumn1,"True"
							

						
End with



'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"