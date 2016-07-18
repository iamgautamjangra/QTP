'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UIControls on Detailed data page.
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_036"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
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
						
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
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

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait7
						
						.webLink("Actions").press
							wait Wait2	
						.webLink("ExportToCSV").assertExist "True"
						
						.webLink("ExportToXLS").assertExist "True"
						
						.webLink("ExportToPDF").assertExist "False"
							
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						.webEdit("Search").assertValue "Search..."
							
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webTable("DetailedData_CS").assertExist "True"
						.webTable("DetailedData_CS_Header").assertExist "True"
						
						.webElement("CustomizeColumn").assertExist "True"
						.webElement("CustomizeColumn").assertStatus "Visible"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Time Range", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Advert Average Play Time(seconds)", "True"
						
						.webTable("DetailedData_CS_Header").assertColumnExist "Total Ad Views", "True"
						
							
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_036"