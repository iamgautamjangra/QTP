'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_Header_AS_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_Header_AS_ValidateUIControls", "REP_ASR_TC_036"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strTimeRange=testcasedata.getvalue("strTimeRange")
strClockNumber=testcasedata.getvalue("strClockNumber")
strElementNumber=testcasedata.getvalue("strElementNumber")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	
With ivm.page(DetailedData_page)	

						.webLink("DetailedData").press
						wait 5
						
											
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
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Placements", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Fasr Forward Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Placements Not Viewed", "True"		
					                        				
											
						.webTable("DetailedData_Header_AS").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Advert Average Play Time", "True"
						
						.webTable("DetailedData_Header_AS").assertColumnExist "Total Ad Views", "True"
					
End with

'End Test CRDe
executionController.stopTestCase_w_TestCRDeNumber "AdvertisementSummary_Generate_DetailedData_Header_AS_ValidateUIControls", "REP_ASR_TC_036"