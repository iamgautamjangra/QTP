'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertising Business_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   01-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertising Business_Generate_DetailedData_ValidateUIControls", "REP_ODRR_TC_037"

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait15

With ivm.page(report_page)

						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						
						.webEdit("PastNoOfHours").setValue strHours
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Cancel").press
						wait Wait5
		
						.webTable("OnDemandReport").assertExist "True"
						
						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
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
						
						.webTable("DetailedData_Header_ODR").assertExist "True"
						
						.webTable("DetailedData_ODR").assertExist "True"
				
						.webTable("DetailedData_Header_ODR").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist " Ad Title", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist " Ad Slot Position", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist " Placement count", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist "Advertisment Full Views", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist "Advertisment Partial Views", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist " Advertisment Fast forward views", "True"
						
						.webTable("DetailedData_Header_ODR").assertColumnExist "Advertisment Not viewed", "True"
						
						
End with



'End Test CRDe
executionController.stopTestCase_w_TestCRDeNumber "Advertising Business_Generate_DetailedData_ValidateUIControls", "REP_ODRR_TC_037"