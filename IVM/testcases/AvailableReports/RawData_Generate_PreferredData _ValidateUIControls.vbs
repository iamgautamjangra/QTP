'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData _ValidateUIControls
' Description					:	Validate the UIControls on preffered data page.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData _ValidateUIControls", "REP_RDR_TC_013"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait Wait5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with


With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							 wait Wait5

							.webTable("PreferredData_RD").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("PreferredData_Header_RD").assertExist "True"
							
				
							.webTable("PreferredData_Header_RD").assertColumnExist "View Date", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Device Id", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Placement View Type Full", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Placement View Type Partial", "True"
							
							'.webTable("PreferredData_Header_RD").assertColumnExist "Placement View Type Fast Forward", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Break Number", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Slot Position", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Element Number", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Clock Number", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Program PID", "True"
							
							.webTable("PreferredData_Header_RD").assertColumnExist "Channel", "True"
							
							'.webTable("PreferredData_Header_RD").assertColumnExist "Total Ad Views", "True"
							
							
							.webLink("BackToPreviousPage").press
					
							
End with	
	
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData _ValidateUIControls", "REP_RDR_TC_013"