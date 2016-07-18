'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	On-DemandReports_GenerateAdvertisingBusiness_ValidatePageControls
' Description					:	Validate Default view Controls of "Advertising Business" report.			
' Author 						:   Fonantrix Solution
' Date 							:   03-01-2014
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidatePageControls", "REP_ODR_TC_002"

ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait10
With ivm.page(OnDemandReportPage)
									
									
						.webTable("AdvertisingBusiness").presstblLink reportOnDemand,3
						wait Wait5
						
						.webLink("BackToPreviousPage").assertStatus "Visible"
						.webLink("BackToPreviousPage").assertExist "True"
						
						.webElement("GenerateOnDemandReport").assertStatus "Visible"
						.webElement("GenerateOnDemandReport").assertExist "True"
					
						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
					
						
						
						.webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
									
											
						.webElement("PastNoOfHours").assertExist "True"
									
						.webElement("PastNoOfHours").assertStatus "Visible"
									
						.webEdit("PastNoOfHours").assertExist "True"
									
						.webEdit("PastNoOfHours").assertStatus "Visible"
						
														
						.webImage("Time").assertStatus "Visible"
									
						.webImage("Time").assertExist "True"
						
						.webElement("DataRangeMsg").assertExist "True"
									
						.webElement("DataRangeMsg").assertStatus "Visible"
						.webElement("DataRangeMsg").assertText "The generated reports will be based on data obtained between 2012-12-12 14:45:00 and 2012-12-12 14:45:00"
									
						.webElement("EmailAndStorageOptions").assertExist "True"
						.webElement("EmailAndStorageOptions").assertStatus "Visible"
						
						
						.webElement("EmailRecipients").assertExist "True"
									
						.webElement("EmailRecipients").assertStatus "Visible"
									
						.webEdit("EmailRecipients").assertExist "True"
									
						.webEdit("EmailRecipients").assertStatus "Visible"
									
						.webButton("AddRecipients").assertExist "True"
									
						.webButton("AddRecipients").assertStatus "Visible"
									
						.webElement("StorageLocation").assertExist "True"
									
						.webElement("StorageLocation").assertStatus "Visible"
									
						.webEdit("StorageLocation").assertExist "True"
									
						.webEdit("StorageLocation").assertStatus "Visible"
									
						.webElement("ReportFormat").assertExist "True"
									
						.webElement("ReportFormat").assertStatus "Visible"
									
						.webList("ReportFormat").assertExist "True"
									
						.webList("ReportFormat").assertStatus "Visible"
									
						.webCheckbox("CompressTheFile").assertExist "True"
									
						.webCheckbox("CompressTheFile").assertStatus "Visible"
									
						.webElement("CompressTheFile").assertExist "True"
									
						.webElement("CompressTheFile").assertStatus "Visible"
									
						.webElement("DataType").assertExist "True"
									
						.webElement("DataType").assertStatus "Visible"
						
						.webList("DataType").assertExist "True"
									
						.webList("DataType").assertStatus "Visible"
									
						.webElement("TypeInComments").assertExist "True"
									
						.webElement("TypeInComments").assertStatus "Visible"
									
						.webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Visible"

'Assert webbutton Cancel

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						.webbutton("Cancel").press
						
End with					         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "On-DemandReports_GenerateAdvertisingBusiness_ValidatePageControls", "REP_ODR_TC_002"