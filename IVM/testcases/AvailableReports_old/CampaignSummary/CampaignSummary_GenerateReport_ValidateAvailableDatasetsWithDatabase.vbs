'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_GenerateReport_ValidateAvailableDatasetsWithDatabase
' Description					:	Validate  Available Datasets With Database.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateAvailableDatasetsWithDatabase", "REP_CSR_TC_009"

sivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvanceSearch_CS").assertExist "True"
					   .webLink("AdvanceSearch_CS").assertStatus "Visible"
					   
					   
					   
						
					   .webEdit("Search").assertExist "True"
					   .webEdit("Search").assertStatus "Visible"
						

'---------------Assert header-----------------------------------------

						.webElement("GenerateCampaignSummaryReport").assertExist "True"
						.webElement("GenerateCampaignSummaryReport").assertStatus "Visible"
												
						.webElement("Description_CS").assertExist "True"
						.webElement("Description_CS").assertStatus "Visible"

						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
        
                     
						'function ToBeDecided
						

						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						
																													
						.webLink("ExportOptions").assertExist "True"
						.webLink("ExportOptions").assertStatus "Visible"
						
						
						
						.webLink("Comments").assertExist "True"
						.webLink("Comments").assertStatus "Visible"
											
						
						
						
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
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateReport_ValidateAvailableDatasetsWithDatabase", "REP_CSR_TC_009"			
