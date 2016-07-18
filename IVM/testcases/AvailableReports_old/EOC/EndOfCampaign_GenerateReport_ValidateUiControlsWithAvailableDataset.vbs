'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_GenerateReport_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate End Of Campaign report" with available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_EOC_TC_004"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

DataSet=testcasedata.getvalue("DataSet")
 
with ivm.page(report_page)

						        .webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						          wait 10

'---------------Assert Back to previous webLink-----------------------

								.webTable("DataSet").presstblRadioBtn DataSet,1 
						     	wait 5
						 
						

						       .webElement("FilterOptions").assertExist "True"
						       .webElement("FilterOptions").assertStatus "Visible"
		                
						
					    
						       .webElement("TimeRange").assertExist "True"
									
						       .webElement("TimeRange").assertStatus "Visible"
									
						       .webEdit("TimeRange").assertExist "True"
									
					         	.webEdit("TimeRange").assertStatus "Visible"
							   
								.webElement("EmailAndStorageOptions").assertExist "True"
								.webElement("EmailAndStorageOptions").assertStatus "Visible"
						
						
						               ''''''Function to validate list and list values wrt dataset.						
									
									
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
									
									
									.webElement("Comments").assertExist "True"
									
									.webElement("Comments").assertStatus "Visible"
									

			            .webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Visible"

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						.webbutton("Cancel").press
			
End with						         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_EOC_TC_004"