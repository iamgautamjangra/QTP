'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_ValidateUIControls 
' Description					:	Validate the UIControls on preffered data page.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_ValidateUIControls", "REP_PSR_TC_020"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPID=testcasedata.getvalue("strProgramPID")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"

						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 

REM 'Market Details table exist					
with ivm.page(preferredData_page)
							.webLink("PreferredData").press
							 wait 5

					
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("PreferredData_PS").assertExist "True"
							
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Time Range", "True"
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Campaign Name", "True"
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Program PID", "True"
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Program Title", "True"
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Channel", "True"
							
							.webTable("PreferredData_Header_PS").assertColumnExist "Total Ad Views", "True"
							
						
End with	


			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_ValidateUIControls", "REP_PSR_TC_020"