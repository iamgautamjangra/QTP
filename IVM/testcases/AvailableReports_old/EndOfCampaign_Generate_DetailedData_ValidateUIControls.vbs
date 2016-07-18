'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UIControls on Detailed data page.
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_036"

'DataSet=testcasedata.getvalue("DataSet")

strComments=testcasedata.getvalue("strComments")


DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
With ivm.page(report_page)

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
						wait Wait10
					
						.webEdit("Comments").setValue strComments
						wait wait2
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
						.webTable("DetailedData_Header_EOC").assertExist "True"
						
						.webElement("CustomizeColumn").assertExist "True"
						.webElement("CustomizeColumn").assertStatus "Visible"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Time Range", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Unique Customers", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Placement Count", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Advert Average Play Time(seconds)", "True"
						
						.webTable("DetailedData_Header_EOC").assertColumnExist "Total Ad Views", "True"
						
							
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ValidateUIControls", "REP_CSR_TC_036"