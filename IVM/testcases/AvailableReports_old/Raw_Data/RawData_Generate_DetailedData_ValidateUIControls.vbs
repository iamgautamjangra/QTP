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

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10
 
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 5
							
							.webTable("DetailedData_RD").assertExist "True"
							
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webLink("Actions").assertExist "True"
						.webLink("Actions").assertStatus "Visible"
						
						.webLink("Actions").press
						wait 2 
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
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Play Time", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Fast Forwards", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Rewinds", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Placement Pauses", "True"
						
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
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign ID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Start Date", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign End Date", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Name", "True"
																								
						.webTable("DetailedData_RD_Header").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Campaign Impression Limit", "True"
																								
						.webTable("DetailedData_RD_Header").assertColumnExist "Client ID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Client Name", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog PAID", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Series Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Episode Title", "True"
						
						.webTable("DetailedData_RD_Header").assertColumnExist "Prog Genre", "True"
						
						'.webTable("DetailedData_RD_Header").assertColumnExist "Total Ad views", "True"
						
						
						
						.webLink("BackToPreviousPage").press
				
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_029"