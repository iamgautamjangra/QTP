'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_PreferredData_ValidateUIControls 
' Description					:	Validate the UIControls on preffered data page.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateUIControls", "REP_CSR_TC_020"


strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
						 .webLink("AdvancedSearch").press
						 wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait5
						
						
						
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
						wait Wait7
						
						strTimeRange=testcasedata.getvalue("strTimeRange")
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						wait wait2
						strCampaign=testcasedata.getvalue("strCampaign")
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
						
						
						.webEdit("EmailRecipients").setValue strEmail
						.webEdit("StorageLocation").setValue strStorageLocation
						.webList("ReportFormat").selectItem strReportFormat
						.webList("DataType").selectItem strDataType
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							 wait Wait8
							 
							 .webLink("Actions").press
						    wait Wait2
							.webLink("ExportToCSV").assertExist "True"
									
							.webLink("ExportToXLS").assertExist "True"
							
							.webLink("ExportToPDF").assertExist "True"
							
							.webEdit("Search").assertExist "True"
							.webEdit("Search").assertStatus "Visible"
							.webEdit("Search").assertValue "Search..."
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							  
							.webTable("PreferredData_CS").assertExist "True"
							.webTable("PreferredData_Header_CS").assertExist "True"
							
							.webTable("PreferredData_Header_CS").assertColumnExist "Time Range", "True"
							
							.webTable("PreferredData_Header_CS").assertColumnExist "Element Number", "True"
							
							.webTable("PreferredData_Header_CS").assertColumnExist "Program PID", "True"
						
							.webTable("PreferredData_Header_CS").assertColumnExist "Campaign Name", "True"
							 
							.webTable("PreferredData_Header_CS").assertColumnExist "Total Ad Views", "True"
							 
							
End with

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateUIControls", "REP_CSR_TC_020"