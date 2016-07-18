'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_PreferredData_ValidateUIControls 
' Description					:	Validate the UI controls of Preferred Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_ValidateUIControls", "REP_EOC_TC_023"


DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						 .webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						  wait 10 
						  
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						
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

							.webTable("PreferredData_EOC").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webLink("Actions").press
							'.webLink("ExportToPDF").assertExist "True"
							'.webLink("ExportToPDF").assertStatus "Visible"
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"
							
							
							.webTable("PreferredData_Header_EOC").assertExist "True"
						
							.webTable("PreferredData_Header_EOC").assertColumnExist "Time Range", "True"
							
							.webTable("PreferredData_Header_EOC").assertColumnExist "Element Number", "True"
							
														
							.webTable("PreferredData_Header_EOC").assertColumnExist "Campaign Name", "True"
							
							.webTable("PreferredData_Header_EOC").assertColumnExist "Total Ad Views", "True"
							
							
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_PreferredData_ValidateUIControls", "REP_EOC_TC_023"