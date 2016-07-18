'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	On-DemandReports_GenerateAdvertisingBusiness_ValidateBackToPreviousPage
' Description					:	Validate the "<Back To Previous Page" link on the Report.
' Author 						:   Fonantrix Solution
' Date 							:   03-01-2014
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidateBackToPreviousPage", "REP_ODR_TC_004"


strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_ON_DEMAND_REPORTS
wait Wait10


With ivm.page(OnDemandReportPage)

						
						.webTable("AdvertisingBusiness").presstblLink reportOnDemand,3
						 wait Wait10					
							
						
						.webEdit("PastNoOfHours").setValue strHours
						
						.webimage("Time").press
						wait Wait2
						
						.webButton("Done").press
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
					     .webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
REM End with 

REM With ivm.page(OnDemandReportPage)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
						
						.webElement("TimeStamp").assertExist "True"							
						.webElement("TimeStamp").assertStatus "Visible"
						
						.weblink("DetailedData").assertExist "True"							
						.weblink("DetailedData").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").press
						 wait Wait7	
REM End With

REM With ivm.page(OnDemandReportPage)
							
						.webElement("GenerateOnDemandReport").assertExist "True"							
						.webElement("GenerateOnDemandReport").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").press
						wait Wait5
							
						.webTable("OnDemandReport").assertExist "True"
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidateBackToPreviousPage", "REP_ODR_TC_004"