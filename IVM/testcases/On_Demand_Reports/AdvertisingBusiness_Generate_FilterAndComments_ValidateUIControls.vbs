'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisingBusiness_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate UI of "Campaign Summary" report in Filters And Comments tab with different options.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisingBusiness_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_019"
   

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
						.webImage("Time").press
						.webButton("Done").press
						wait Wait2
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

'Market Details table exist					
with ivm.page(OnDemandReportPage)

							.webLink("BackToPreviousPage").assertStatus "Visible"
							.webLink("BackToPreviousPage").assertExist "True"
							
							.webElement("OnDemandReport").assertExist "True"
							.webElement("OnDemandReport").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"
                            
							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							
													 
							.webLink("DetailedData").assertExist "True"
							.webLink("DetailedData").assertStatus "Visible"

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
						

							.webLink("ExportToPDF").assertExist "True"
							.webLink("ExportToPDF").assertStatus "Visible"
		                    
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("DataRangeMsg").assertExist "True"
							.webElement("DataRangeMsg").assertStatus "Visible"
														
							 
					        .webLink("BackToPreviousPage").press
			                 wait Wait5
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisingBusiness_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_019"