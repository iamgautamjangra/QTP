'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_GenerateReport_ValidateUiControlsWithAvailableDataset
' Description					:	Validate  Controls of "Generate Advertisement And Program Details report" with available data set.			
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_APD_TC_004"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5


strSeachValue=testcasedata.getvalue("strSeachValue")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strEmailRecipints

 
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
        
                       	.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5

						
						

						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
		          "ToBeDecided "      REM .webLink("FilterOptions").press
					    REM wait 5
						
					    strSites=testcasedata.getvalue("strSites")
						.webEdit("strSites").assertValue strSites
						wait 5
							
						strSiteGroups=testcasedata.getvalue("strSiteGroups")
						.webEdit("strSiteGroups").assertValue strSiteGroups
						wait 5
							
						strProviderId=testcasedata.getvalue("strProviderId")
						.webEdit("strProviderId").assertValue strProviderId
						wait 5
						
						strCampaign=testcasedata.getvalue("strCampaign")
						.webEdit("strCampaign").assertValue strCampaign
						wait 5
							
						
						
						
						
						
						
						.webLink("ExportOptions").assertExist "True"
						.webLink("ExportOptions").assertStatus "Visible"
						.webLink("ExportOptions").press
						
						assertTextWE "ToBeDecided", "True"
						
						
						.webLink("Comments").assertExist "True"
						.webLink("Comments").assertStatus "Visible"
						.webLink("Comments").press
						
						assertTextWE "ToBeDecided", "True"
						
						
						
						
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_GenerateReport_ValidateUiControlsWithAvailableDataset", "REP_APD_TC_004"