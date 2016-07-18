'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls", "REP_APD_TC_038"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADPROGRAMDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
						wait Wait10	
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3

						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
						Browser("SeaChangeManagementConsole").Refresh
						wait wait8
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3
						End If
						.webTable("DataSet").presstblRadioBtn DataSet,1

						wait Wait10
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
						wait Wait5
						
											
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webLink("Actions").press
						.webLink("ExportToCSV").assertExist "True"
						.webLink("ExportToCSV").assertStatus "Visible"
						
						.webLink("ExportToXLS").assertExist "True"
						.webLink("ExportToXLS").assertStatus "Visible"
						
						.webLink("ExportToPDF").assertExist "False"
						
						.webTable("DetailedData_APD").assertExist "True"
						.webTable("DetailedData_Header_APD").assertExist "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Time Range", "True"						
										
						.webTable("DetailedData_Header_APD").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program PAID", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Title", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Episode Title", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Series Title", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Episode ID", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Placement Count", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Views", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Program Partial Views", "True"
												
						.webTable("DetailedData_Header_APD").assertColumnExist "Ad Title", "True"
												
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Full Views", "True"
												
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Advert Average Play Time", "True"
						
						.webTable("DetailedData_Header_APD").assertColumnExist "Total Ad Views", "True"
						
						
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls", "REP_APD_TC_038"