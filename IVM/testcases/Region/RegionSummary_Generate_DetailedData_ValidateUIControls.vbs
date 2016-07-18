'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ValidateUIControls", "REP_RSR_TC_036"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
						wait Wait5
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
						
											
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webTable("DetailedData_Header_RS").assertExist "True"
						
						.webTable("DetailedData_RS").assertExist "True"
				
						.webTable("DetailedData_Header_RS").assertColumnExist "Time Range", "True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Element Number","True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Campaign Name", "True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Clock Number", "True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Region ID","True"
                        .webTable("DetailedData_Header_RS").assertColumnExist "Region Name","True"					
						.webTable("DetailedData_Header_RS").assertColumnExist "Region Group Name","True"
						
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Fast Forward Views", "True"
						
						
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Placements Not Viewed", "True"
											
						.webTable("DetailedData_Header_RS").assertColumnExist "Total Home Views", "True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Advert Average Play Time","True"
						.webTable("DetailedData_Header_RS").assertColumnExist "Total Ad Views", "True"	

						
End with


executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ValidateUIControls", "REP_RSR_TC_036"
