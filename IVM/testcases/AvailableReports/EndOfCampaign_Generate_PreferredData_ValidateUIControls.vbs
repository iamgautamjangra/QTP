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


'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

with ivm.page(report_page)

						 .webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
						wait wait5
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

REM 'Market Details table exist					
with ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							 wait Wait5

							.webTable("PreferredData_EOC").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webLink("Actions").press
							.webElement("ExportToPDF").assertExist "True"
							.webElement("ExportToPDF").assertStatus "Visible"
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