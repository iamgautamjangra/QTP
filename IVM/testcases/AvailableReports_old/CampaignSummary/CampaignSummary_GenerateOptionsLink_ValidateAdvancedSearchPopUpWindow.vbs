'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_GenerateOptionsLink_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_005"

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
					   .webLink("AdvanceSearch_CS").press
					   
					   'To Be Decided
					   		   
										     
                     				
						

						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").assertStatus "Disable"
		         
																													
						.webLink("ExportOptions").assertExist "True"
						.webLink("ExportOptions").assertStatus "Visible"
						.webLink("ExportOptions").assertStatus "Disable"
						
						
						
						.webLink("Comments").assertExist "True"
						.webLink("Comments").assertStatus "Visible"
						.webLink("Comments").assertStatus "Disable"
												
						
						
						
'---------------Assert Radio Group---------------------------------------------
'Assert webbutton generate

			            .webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Visible"
						.webbutton("Generate").assertStatus "Disable"

'Assert webbutton Cancel

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						.webbutton("Cancel").press
						 wait 5
End with						         
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_005"			
