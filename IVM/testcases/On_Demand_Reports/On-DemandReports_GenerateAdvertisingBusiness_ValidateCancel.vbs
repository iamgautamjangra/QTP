'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	On-DemandReports_GenerateAdvertisingBusiness_ValidateCancel
' Description					:	Validate the Cancel operation on "Generate On-Demand Report" page.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidateCancel", "REP_ODR_TC_003"

ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait10

strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

With ivm.page(OnDemandReportPage)

						.webTable("AdvertisingBusiness").presstblLink reportOnDemand,3
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
						
						.webTable("AdvertisingBusiness").presstblLink reportOnDemand,3
						 wait Wait10	
						.webButton("Cancel").press
						
						wait Wait5
						.webTable("AdvertisingBusiness").assertExist "True"
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidateCancel", "REP_ODR_TC_003"