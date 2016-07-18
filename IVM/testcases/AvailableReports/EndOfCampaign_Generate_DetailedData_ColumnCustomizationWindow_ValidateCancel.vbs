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
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")
strSearchTerm=testcasedata.getvalue("strSearchTerm")
strSearchTerm1=testcasedata.getvalue("strSearchTerm1")


DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
								wait Wait10
		
							
							.webEdit("EmailRecipients").setValue strEmail
							

							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_Header_EOC").assertExist "True"
							.webTable("DetailedData_Header_EOC").pressColumnCustomization 
							wait Wait3
																										
					        .selectCustomizeColumn strColumn,"False"
							.selectCustomizeColumn strColumn1,"False"
							

							.webLink("CustomizeCancel").press
							wait Wait5
							
										
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_Header_EOC").assertCustomizeColumnExist strColumn1,"True"
							

						
End with



'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"