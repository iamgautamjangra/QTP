'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateUIControls", "REP_ASR_TC_036"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strTimeRange=testcasedata.getvalue("strTimeRange")
strClockNumber=testcasedata.getvalue("strClockNumber")
strElementNumber=testcasedata.getvalue("strElementNumber")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

With ivm.page(DetailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
						
											
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webTable("DetailedData_AS").assertExist "True"
				
						.webTable("DetailedData_Header_AS").assertColumnExist "Time Range", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Campaign Name", "True"
						
                        .webTable("DetailedData_Header_AS").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Program Provider", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Ad Title", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Ad Break", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Ad Slot Position", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Placements Not Viewed", "True"		
					     
						 .webTable("DetailedData_Header_AS").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Average Play Time", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Total Ad Views", "True"
					
End With
REM 'End Test CRDe
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateUIControls","REP_ASR_TC_036"
