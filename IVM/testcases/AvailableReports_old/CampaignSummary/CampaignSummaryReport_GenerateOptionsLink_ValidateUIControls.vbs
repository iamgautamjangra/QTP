'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_GenerateOptionsLink_ValidateUIControls
' Description					:	Validate Default view Controls of "Campaign Summary" when selected on main page.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_GenerateOptionsLink_ValidateUIControls", "REP_CSR_TC_002"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						wait 10

'---------------Assert Back to previous webLink-----------------------

					   .webLink("BackToPreviousPage").assertExist"True"
					   .webLink("BackToPreviousPage").assertStatus"Visible"

'---------------Assert header-----------------------------------------

						.webElement("GenerateCampaignSummary").assertExist "True"
						.webElement("GenerateCampaignSummary").assertStatus "Visible"

						.webElement("GeneralReportInformation").assertExist "True"
						.webElement("GeneralReportInformation").assertStatus "Visible"

'---------------Assert label Report Name-------------------------------


						.webElement("Report_CS").assertExist "True"
						.webElement("Report_CS").assertStatus "Visible"

						.webElement("Report_CS").assertText reportCampaignSummary

'---------------Assert label description----------------------------------

						.webElement("Description_CS").assertExist "True"
						.webElement("Description_CS").assertStatus "Visible"

						.webElement("Description_CS").assertText Desc_CS


'----------------Assert header-----------------------------------------------

						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"

'---------------Assert Radio Group---------------------------------------------

						.webElement("StartDate").assertExist "True"
						.webElement("StartDate").assertStatus "Visible"
						.webImage("StartDate").assertExist "True"
						.webImage("StartDate").assertStatus "Visible"
						.webEdit("StartDate").assertExist "True"
						.webEdit("StartDate").assertStatus "Visible"

'Assert End Date

			            .webElement("EndDate").assertExist "True"
						.webElement("EndDate").assertStatus "Visible"
						.webImage("EndDate").assertExist "True"
						.webImage("EndDate").assertStatus "Visible"
						.webEdit("EndDate").assertExist "True"
						.webEdit("EndDate").assertStatus "Visible"
						
						
'Assert Include Data from

						.webElement("IncludeDataFrom").assertExist "True"
						.webElement("IncludeDataFrom").assertStatus "Visible"
						
'Assert weblist Sites

			            .webElement("Sites").assertExist "True"
						.webElement("Sites").assertStatus "Visible"
						.webEdit("Sites").assertExist "True"
						.webEdit("Sites").assertStatus "Visible"
						
'Assert start date

			            .webElement("SiteGroups").assertExist "True"
						.webElement("SiteGroups").assertStatus "Visible"
						.webEdit("SiteGroups").assertExist "True"
						.webEdit("SiteGroups").assertStatus "Visible"						
						

'Assert weblist ProviderIds

			            .webElement("ProviderIDs").assertExist "True"
						.webElement("ProviderIDs").assertStatus "Visible"
						.webEdit("ProviderIDs").assertExist "True"
						.webEdit("ProviderIDs").assertStatus "Visible"
						
						
'Assert weblist Campaign

			            .webElement("Campaigns").assertExist "True"
						.webElement("Campaigns").assertStatus "Visible"
						.webEdit("Campaigns").assertExist "True"
						.webEdit("Campaigns").assertStatus "Visible"						

'Assert weblist Grouping

			            .webElement("Grouping").assertExist "True"
						.webElement("Grouping").assertStatus "Visible"
						.webList("Grouping").assertExist "True"
						.webList("Grouping").assertStatus "Visible"						
						
'Assert header comment

			            .webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
						.webEdit("Comments").assertExist "True"
						.webEdit("Comments").assertStatus "Visible"

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
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_GenerateOptionsLink_ValidateUIControls", "REP_CSR_TC_002"