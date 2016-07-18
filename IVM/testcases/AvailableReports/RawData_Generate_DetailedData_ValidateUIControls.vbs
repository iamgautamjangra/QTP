'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UIControls on Detailed data page.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_029"

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
							
							.webTable("DetailedData_RD").assertExist "True"
							
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webLink("Actions").assertExist "True"
						.webLink("Actions").assertStatus "Visible"
						
						.webLink("Actions").press
						wait Wait2 
						.webLink("ExportToCSV").assertExist "True"
						.webLink("ExportToCSV").assertStatus "Visible"
						
						.webLink("ExportToPDF").assertExist "False"
						.webLink("ExportToXLS").assertExist "False"
						
						.webTable("DetailedData_RD_Header").assertExist "True"
						.webTable("DetailedData_RD").assertExist "True"
						
												
						.webTable("DetailedData_RD_Header").assertColumnExist "Bind GUID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "View Date", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Device Id", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Asset Type", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement View Type Unknown", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement View Type Full", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement View Type Partial", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement View Type Fast Forward", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Play Time Secs", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Fast Forward Count", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Rewind Count", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Pause Count", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Not Viewed", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Break Number", "True"
																							
						.webTable("DetailedData_RD_Header").assertColumnExist "Slot Position", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Ad PID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Ad PAID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Ad Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Ad Impression Limit", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Ad Duration", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Region ID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Region Name", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Region Group Name", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Id", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Start Date", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign End Date", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Name", "True"
																								
						.webTable("DetailedData_RD_Header").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Impression Limit", "True"
																								
						.webTable("DetailedData_RD_Header").assertColumnExist "Client Id", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Client Name", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog PID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog PAID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Series Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Episode Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Genre", "True"
						
						
						
						
						
						.webLink("BackToPreviousPage").press
				
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_029"