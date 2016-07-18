'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate VOD Ad Delivery Data Feed report" with available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset", "REP_CSR_TC_004"

REM ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
REM wait 5

strSeachValue=testcasedata.getvalue("strSeachValue")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDatatype=testcasedata.getvalue("strDatatype")
strProvider=testcasedata.getvalue("strProvider")



 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvancedSearch").assertExist "True"
					   .webLink("AdvancedSearch").assertStatus "Visible"
						
					   .webEdit("Search").assertExist "True"
					   .webEdit("Search").assertStatus "Visible"
						

'---------------Assert header-----------------------------------------

						.webElement("GeneralReportInformation").assertExist "True"
						.webElement("GeneralReportInformation").assertStatus "Visible"
						.webElement("GeneralReportInformation").assertText "Generate VOD Ad Delivery Report"
												
						.webElement("Description").assertExist "True"
						.webElement("Description").assertStatus "Visible"
						.webElement("Description").assertText Desc_VOD

						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						
						
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
					
        
                        .webTable("DataSet").presstblRadioBtn strSeachValue,1
						
						

						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
					    wait 5
									    					
												
					
						.webElement("TimeRange").assertExist "True"
									
						.webElement("TimeRange").assertStatus "Visible"
									
						.webEdit("TimeRange").assertExist "True"
									
						.webEdit("TimeRange").assertStatus "Visible"
									
									
						.webElement("SelectaProveder").assertExist "True"
									
						.webElement("SelectaProveder").assertStatus "Visible"
									
						.webList("SelectaProveder").assertExist "True"
									
						.webList("SelectaProveder").assertSelectedItem strProvider
									
							
						
						
						
						
						
						
						REM .webElement("ExportOptions").assertExist "True"
						REM .webElement("ExportOptions").assertStatus "Visible"
						
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
						
						.webElement("ReportFormat").assertStatus "Visible"
						.webElement("ReportFormat").assertExist "True"
						.webList("ReportFormat").assertStatus "Visible"
						.webList("ReportFormat").assertExist "True"
						.webList("ReportFormat").assertSelectedItem strReportFormat
						
						.webCheckBox("CompressFile").assertExist "True"
						.webCheckBox("CompressFile").assertStatus "Visible"
						.webElement("CompressFile").assertExist "True"
						.webElement("CompressFile").assertStatus "Visible"
									
						.webElement("DataType").assertExist "True"
						.webElement("DataType").assertStatus "Visible"
						.webList("DataType").assertExist "True"
						.webList("DataType").assertSelectedItem strDatatype
						
						
						.webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
						
						.webElement("TypeInComments").assertExist "True"
									
						.webElement("TypeInComments").assertStatus "Visible"
						
						.webEdit("Comments").assertExist "True"
						.webEdit("Comments").assertStatus "Visible"
						
						
						
						
'---------------Assert Radio Group---------------------------------------------
'Assert webbutton generate

			            .webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Visible"

'Assert webbutton Cancel

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						.webbutton("Cancel").press
						 wait 5
End with						         

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateUiControlsWithAvailableDataset", "REP_CSR_TC_004"