'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AllDetailsReport_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ValidateUIControls", "REP_ADR_TC_020"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						 
						.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
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
						

						
						
						
						.webTable("DetailedData_AD").assertExist "True"
						.webTable("DetailedData_Header_AD").assertExist "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Time Range", "True"						
										
						.webTable("DetailedData_Header_AD").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Region Name", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Region Group Name", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program PAID", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Title", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Episode Title", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Series Title", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Episode ID", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Placement Count", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Views", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Program Partial Views", "True"
												
						.webTable("DetailedData_Header_AD").assertColumnExist "Ad Title", "True"
												
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Full Views", "True"
												
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Advert Average Play Time", "True"
						
						.webTable("DetailedData_Header_AD").assertColumnExist "Total Ad Views", "True"
						
						
						
End with


'End Test CRDe
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_ValidateUIControls", "REP_ADR_TC_020"