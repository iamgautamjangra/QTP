'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_GenerateOptionsLink_ValidateUIControls
' Description					:	Validate Default view Controls of "Campaign Summary" when selected on main page.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_ValidateUIControls", "REP_CSR_TC_002"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait20
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						wait Wait20

'---------------Assert Back to previous webLink-----------------------
                       .webLink("BackToPreviousPage").assertStatus"Visible"
					   .webLink("BackToPreviousPage").assertExist"True"
					   

'---------------Assert header-----------------------------------------

						.webElement("GenerateCampaignSummary").assertExist "True"
						.webElement("GenerateCampaignSummary").assertStatus "Visible"
						.webElement("GenerateCampaignSummary").assertText "Generate "& reportCampaignSummary & " Report"

'---------------Assert label description----------------------------------
						.webElement("Description_CS").assertExist "True"
						.webElement("Description_CS").assertStatus "Visible"
						.webElement("Description_CS").assertText Desc_CS

						
						.webElement("SelectaDatasetForThisReport").assertExist "True"
						.webElement("SelectaDatasetForThisReport").assertStatus "Visible"
						
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webTable("DataSet_Header").assertExist "True"
						.webTable("DataSet_Header").assertColumnExist "Dataset Name" ,"True"
						.webTable("DataSet_Header").assertColumnExist "Dataset Creation Timestamp" ,"True"
						.webTable("DataSet_Header").assertColumnExist "User" ,"True"
						.webTable("DataSet_Header").assertColumnExist "Parameter" ,"True"
						.webTable("DataSet").assertExist "True"
						
						.webRadioGroup("DataSet").assertExist "True"
						
'----------------Assert header-----------------------------------------------

						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
		                .webElement("FilterOptions_Expand").assertExist "True"
						.webElement("FilterOptions_Expand").assertStatus "Visible"
						.webElement("FilterOptions_Expand").press
						.webElement("FilterOptionsExpand_Text").assertExist "True"
						.webElement("FilterOptionsExpand_Text").assertStatus "Visible"
						.webElement("FilterOptionsExpand_Text").assertText FilterOptions_msg
						
                          
						
						.webElement("EmailAndStorageOptions").assertExist "True"
						.webElement("EmailAndStorageOptions").assertStatus "Visible"
						.webElement("EmailAndStorageOptions_Expand").assertExist "True"
						.webElement("EmailAndStorageOptions_Expand").assertStatus "Visible"
						.webElement("EmailAndStorageOptions_Expand").press
						.webElement("EmailAndStorageOptionsExpand_Text").assertExist "True"
						.webElement("EmailAndStorageOptionsExpand_Text").assertStatus "Visible"
						.webElement("EmailAndStorageOptionsExpand_Text").assertText EmailAndStorageOptions_msg
						
					
						
						
						.webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
						.webElement("Comments_Expand").assertExist "True"
						.webElement("Comments_Expand").assertStatus "Visible"
						.webElement("Comments_Expand").press
						wait wait2
						
						.webEdit("TimeRange").assertExist "False"
						.webEdit("Campaigns").assertExist "False"
						
						

'Assert webbutton generate

			            .webbutton("Generate").assertExist "True"
						.webbutton("Generate").assertStatus "Disable"

'Assert webbutton Cancel

                        .webbutton("Cancel").assertExist "True"
						.webbutton("Cancel").assertStatus "Visible"
						
End with						            

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_GenerateOptionsLink_ValidateUIControls", "REP_CSR_TC_002"