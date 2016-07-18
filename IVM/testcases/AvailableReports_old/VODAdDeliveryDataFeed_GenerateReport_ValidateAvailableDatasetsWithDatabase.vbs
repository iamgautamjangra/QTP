'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_GeneralReportInformation_ValidateAvailableDatasetsWithDatabase
' Description					:	Validate  Available Datasets With Database.
' Author 						:   SeaChange
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateAvailableDatasetsWithDatabase", "REP_VOD_TC_009"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait5

 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						wait Wait10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvancedSearch").assertExist "True"
					   .webLink("AdvancedSearch").assertStatus "Visible"
					   
					   
					   
						
					   .webEdit("SearchTerm").assertExist "True"
					   .webEdit("SearchTerm").assertStatus "Visible"
						

'---------------Assert header-----------------------------------------

						.webElement("GenerateVODAdDeliveryDataFeedReport").assertExist "True"
						.webElement("GenerateVODAdDeliveryDataFeedReport").assertStatus "Visible"
												
						.webElement("Description_VOD").assertExist "True"
						.webElement("Description_VOD").assertStatus "Visible"

						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation Timestamp","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameter","True"
        
						.webTable("DataSet").assertTableData "DataSet",reportVODAdDelivery
						'function
						

						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
						
																													
						.webElement("EmailAndStorageOptions").assertExist "True"
						.webElement("EmailAndStorageOptions").assertStatus "Visible"
						
						
						
						.webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
											
						
						
						
'---------------Assert Radio Group---------------------------------------------
'Assert webbutton generate

			            .webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Visible"

'Assert webbutton Cancel

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						.webbutton("Cancel").press
						 wait Wait5
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateAvailableDatasetsWithDatabase", "REP_VOD_TC_009"			
