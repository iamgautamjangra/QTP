'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_GenerateOptionsLink_ValidateUIControls
' Description					:	Validate Default view Controls of "VOD Ad Delivery Data Feed" report.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GenerateOptionsLink_ValidateUIControls", "REP_VOD_TC_002"

REM ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
REM wait 5

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
        
		               REM strParametersValue=replace(strParameter,";",",")
                        REM .webTable("SelectaDatasetforThisReport").assertTblvalue(strParametersValue,4)
						REM .webTable("SelectaDatasetforThisReport").assertTblRadioBtn(strParameterValue,1,"True")
						REM .webTable("SelectaDatasetforThisReport").pressRadioBtn(strParameterValue,1)
						REM .WebImage("ExpandIcon").assertStatus("Visible")


						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
						.webElement("FilterOptions_Expand").press
						
                       .webElement("NeedToSelectDataSet1").assertText FilterOptions_msg
						
						.webElement("ExportOptions").assertExist "True"
						.webElement("ExportOptions").assertStatus "Visible"
				     	.webElement("ExportOptions_Expand").press
						
						.webElement("NeedToSelectDataSet2").assertText ExportOptions_msg
						
						
						.webElement("Comments").assertExist "True"
						.webElement("Comments").assertStatus "Visible"
						.webElement("Comments_Expand").press
					
						
						.webElement("NeedToSelectDataSet3").assertText Comments_msg
									
						
						
						
						
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
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_GenerateOptionsLink_ValidateUIControls", "REP_VOD_TC_002"