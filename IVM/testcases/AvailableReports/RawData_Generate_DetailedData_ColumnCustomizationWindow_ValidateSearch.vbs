'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch
' Description					:	Validate the search available in customised column window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_RDR_TC_045"

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


if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
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
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_CS_Header").assertExist "True"
							.webTable("DetailedData_CS_Header").pressColumnCustomization 
							wait Wait3
							
					        .webedit("CustomizeSearch").assertExist "True"
					        .webedit("CustomizeSearch").assertStatus "Visible"
					         wait Wait5
							
						    .webEdit("CustomizeSearch").setValue strSearchTerm					
						     wait Wait2
							.assertExistWE strColumn,"True"
							.selectCustomizeColumn strColumn,"False"
							
							
							.selectCustomizeColumn strColumn,"True"
							
							
							.webImage("CustomizeSearchClear").press
							.assertExistWE strColumn1,"True"
							.selectCustomizeColumn strColumn1,"False"
							.selectCustomizeColumn strColumn1,"True"
							
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateSearch", "REP_RDR_TC_045"