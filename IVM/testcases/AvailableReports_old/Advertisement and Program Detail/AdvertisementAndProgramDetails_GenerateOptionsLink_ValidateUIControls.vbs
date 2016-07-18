'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls
' Description					:   Validate Default view Controls of "Advertisement And Program Details" report..			
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls", "REP_APD_TC_002"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"
					   
					   .webLink("AdvanceSearch_APD").assertExist "True"
					   .webLink("AdvanceSearch_APD").assertStatus "Visible"
						
					   .webEdit("Search").assertExist "True"
					   .webEdit("Search").assertStatus "Visible"
						

'---------------Assert header-----------------------------------------

						.webElement("GenerateAdvertisementAndProgramDetailsReport").assertExist "True"
						.webElement("GenerateAdvertisementAndProgramDetailsReport").assertStatus "Visible"
												
						.webElement("Description_APD").assertExist "True"
						.webElement("Description_APD").assertStatus "Visible"

						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
        


						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
		                .webLink("FilterOptions").press
						
						assertTextWE DATA_APD, "True"
						
						.webLink("ExportOptions").assertExist "True"
						.webLink("ExportOptions").assertStatus "Visible"
						.webLink("ExportOptions").press
						
						assertTextWE DATA_APD, "True"
						
						
						.webLink("Comments").assertExist "True"
						.webLink("Comments").assertStatus "Visible"
						.webLink("Comments").press
						
						assertTextWE DATA_APD, "True"
						
						
						
						
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_GenerateOptionsLink_ValidateUIControls", "REP_APD_TC_002"