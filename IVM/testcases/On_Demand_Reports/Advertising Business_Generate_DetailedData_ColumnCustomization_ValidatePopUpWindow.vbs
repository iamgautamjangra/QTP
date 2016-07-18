'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	Advertisementisementising Business_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Advertisementisementising Business_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"
strHours=testcasedata.getvalue("strHours")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.ClickToMenu MENU_ON_DEMAND_REPORTS
wait Wait7

With ivm.page(report_page)

						.webTable("OnDemandReport").presstblLink reportOnDemand,3
						 wait Wait10	
						 
						.webEdit("PastNoOfHours").setValue strHours
									
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
							 
							
							
							.webTable("DetailedData_ODR").assertExist "True"
							.webTable("DetailedData_Header_ODR").pressColumnCustomization 
							wait Wait5
							
							.webEdit("CustomizeSearch").assertExist "True"
					        .webEdit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DispalyedColumns").assertExist "True"
							.webElement("DispalyedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
							
							NoColumnsToDisplay
							.webElement("NoColumnsToDisplay").assertExist "True"
							.webElement("NoColumnsToDisplay").assertStatus "Visible"
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						    .assertExistWE "Campaign Name","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "Ad Slot Position","True"
							.assertExistWE "Placement count","True"
							.assertExistWE "Advertisementisementisment Full Views","True"
							.assertExistWE "Advertisementisementisment Partial Views","True"
							.assertExistWE "Advertisementisementisment Fast forward views","True"
							.assertExistWE "Advertisementisementisment Not viewed","True"
							
						    
							.webCheckBox("CampaignName").assertExist "True"					
							.webCheckBox("CampaignName").assertStatus "Visible"
							.webCheckBox("CampaignName").assertStatus "Checked"
							.webCheckBox("CampaignName").assertStatus "Disabled"
							
							.webCheckBox("AdTitle").assertExist "True"					
							.webCheckBox("AdTitle").assertStatus "Visible"
							.webCheckBox("AdTitle").assertStatus "Checked"
							.webCheckBox("AdTitle").assertStatus "Disabled"
						
							.webCheckBox("AdSlotPosition").assertExist "True"
							.webCheckBox("AdSlotPosition").assertStatus "Visible"										
							.webCheckBox("AdSlotPosition").assertStatus "Checked"
							.webCheckBox("AdSlotPosition").assertStatus "Disabled"
														
							.webCheckBox("PlacementCount").assertExist "True"					
							.webCheckBox("PlacementCount").assertStatus "Visible"
							.webCheckBox("PlacementCount").assertStatus "Checked"
							
							
							.webCheckBox("AdvertisementisementFullViews").assertExist "True"
							.webCheckBox("AdvertisementisementFullViews").assertStatus "Visible"										
							.webCheckBox("AdvertisementisementFullViews").assertStatus "Checked"
						
							
							
							.webCheckBox("AdvertisementPartialViews").assertExist "True"					
							.webCheckBox("AdvertisementPartialViews").assertStatus "Visible"
							.webCheckBox("AdvertisementPartialViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertisementFastForwardViews").assertExist "True"					
							.webCheckBox("AdvertisementFastForwardViews").assertStatus "Visible"
							.webCheckBox("AdvertisementFastForwardViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertisementNotViewed").assertExist "True"					
							.webCheckBox("AdvertisementNotViewed").assertStatus "Visible"
							.webCheckBox("AdvertisementNotViewed").assertStatus "Checked"
							
							
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
			
							
							
			
End with


'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "Advertisementising Business_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"