'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_GenerateOptionsLink_ValidateFilterBySearch
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_GenerateOptionsLink_ValidateFilterBySearch", "REP_ASR_TC_007"

sivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvanceSearch_AS").assertExist "True"
					   .webLink("AdvanceSearch_AS").assertStatus "Visible"
					 
					   					   						
					   .webEdit("Search").assertExist "True"
					   .webEdit("Search").assertStatus "Visible"
					   .webEdit("Search").setvalue "strsearch"
					   wait 5
					   
					   .webLink("Search").assertExist "True"
					   .webLink("Search").assertStatus "Visible"
					   .webLink("Search").press
					   
					   					   
					   'To Be Decided
					   
					   
						

'---------------Assert header-----------------------------------------

						.webElement("GenerateAdvertisementSummaryReport").assertExist "True"
						.webElement("GenerateAdvertisementSummaryReport").assertStatus "Visible"
												
						.webElement("DDescription_R").assertExist "True"
						.webElement("Description_AS").assertStatus "Visible"

						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Data Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
        
                     
						
						

						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
		
		         
																													
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_GenerateOptionsLink_ValidateFilterBySearch", "REP_ASR_TC_007"			