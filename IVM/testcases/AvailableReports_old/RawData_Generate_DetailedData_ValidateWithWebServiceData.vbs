'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_ValidateWithWebServiceData
' Description					:	Validate the data with webservices for detailed data 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateWithWebServiceData", "REP_RDR_TC_049"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


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
							wait Wait5
							
							.webTable("DetailedData_RD").assertTableData reportRawDataDetailed,DataSet
					
							
							
End with

					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateWithWebServiceData", "REP_RDR_TC_049"