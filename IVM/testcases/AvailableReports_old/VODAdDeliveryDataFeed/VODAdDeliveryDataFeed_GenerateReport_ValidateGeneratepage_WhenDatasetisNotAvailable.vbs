'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable
' Description					:	Validate  Controls of "Generate VOD Ad Delivery Data Feed report" with no available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_VOD_TC_003"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvanceSearch_CS").assertExist "True"
					   .webLink("AdvanceSearch_CS").assertStatus "Visible"
						
					   .webEdit("Search").assertExist "True"
					   .webEdit("Search").assertStatus "Visible"
						

'---------------Assert header-----------------------------------------

						.webElement("GenerateVODAdDeliveryDataFeedReport").assertExist "True"
						.webElement("GenerateVODAdDeliveryDataFeedReport").assertStatus "Visible"
												
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
        
                        .webTable("SelectaDatasetforThisReport").assertTblvalue("No Data Exist")


						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
		                .webLink("FilterOptions").press
						
						assertTextWE DATA_CS, "True"
						
						.webLink("ExportOptions").assertExist "True"
						.webLink("ExportOptions").assertStatus "Visible"
						.webLink("ExportOptions").press
						
						assertTextWE DATA_CS, "True"
						
						
						.webLink("Comments").assertExist "True"
						.webLink("Comments").assertStatus "Visible"
						.webLink("Comments").press
						
						assertTextWE DATA_CS, "True"
						
						
						
						
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
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GeneralReportInformation_ValidateGeneratepage_WhenDatasetisNotAvailable", "REP_VOD_TC_003"