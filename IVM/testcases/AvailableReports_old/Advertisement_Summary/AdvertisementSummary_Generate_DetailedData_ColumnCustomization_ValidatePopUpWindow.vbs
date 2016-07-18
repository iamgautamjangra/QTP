'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait 5
							 
							
							
							.webTable("DetailedData").assertExist "True"
							.webTable("DetailedData_Header_AS").pressColumnCustomization 
							wait 5
							
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
						   
						    .assertExistWE "Time Range","True"
							.assertExistWE "Campaign Name","True"
							.assertExistWE "Element Number","True"
							.assertExistWE "Clock Number","True"
							.assertExistWE "Program Provider","True"
							.assertExistWE "Ad Slot Position","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "Ad Break","True"
							.assertExistWE "Unique Customers","True"
							.assertExistWE "Advert Placements","True"
							.assertExistWE "Advert Full Views","True"
							.assertExistWE "Advert Partial Views","True"
							.assertExistWE "Advert Fast Forward Views","True"
							.assertExistWE "Advert Placements Not Viewed","True"
							.assertExistWE "Total Home Views","True"
							.assertExistWE "Advert Average Play Time","True"
							.assertExistWE "Total Ad Views","True"
							
						    
							REM .webCheckBox("TimeRange").assertExist "True"					
							REM .webCheckBox("TimeRange").assertStatus "Visible"
							REM .webCheckBox("TimeRange").assertStatus "Checked"
							REM .webCheckBox("TimeRange").assertStatus "Disabled"
							
							REM .webCheckBox("ElementNumber").assertExist "True"					
							REM .webCheckBox("ElementNumber").assertStatus "Visible"
							REM .webCheckBox("ElementNumber").assertStatus "Checked"
							REM .webCheckBox("ElementNumber").assertStatus "Disabled"
						
							REM .webCheckBox("CampaignName").assertExist "True"
							REM .webCheckBox("CampaignName").assertStatus "Visible"										
							REM .webCheckBox("CampaignName").assertStatus "Checked"
							REM .webCheckBox("CampaignName").assertStatus "Disabled"
														
							REM .webCheckBox("ClockNumber").assertExist "True"					
							REM .webCheckBox("ClockNumber").assertStatus "Visible"
							REM .webCheckBox("ClockNumber").assertStatus "Checked"
							
							
							REM .webCheckBox("ProgramPID").assertExist "True"
							REM .webCheckBox("ProgramPID").assertStatus "Visible"										
							REM .webCheckBox("ProgramPID").assertStatus "Checked"
							REM .webCheckBox("ProgramPID").assertStatus "Disabled"
							
							
							REM .webCheckBox("UniqueCustomers").assertExist "True"					
							REM .webCheckBox("UniqueCustomers").assertStatus "Visible"
							REM .webCheckBox("UniqueCustomers").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertPlacements").assertExist "True"					
							REM .webCheckBox("AdvertPlacements").assertStatus "Visible"
							REM .webCheckBox("AdvertPlacements").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertFullViews").assertExist "True"					
							REM .webCheckBox("AdvertFullViews").assertStatus "Visible"
							REM .webCheckBox("AdvertFullViews").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertPartialViews").assertExist "True"					
							REM .webCheckBox("AdvertPartialViews").assertStatus "Visible"
							REM .webCheckBox("AdvertPartialViews").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertFastForwardViews").assertExist "True"					
							REM .webCheckBox("AdvertFastForwardViews").assertStatus "Visible"
							REM .webCheckBox("AdvertFastForwardViews").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertPlacementsNotViewed").assertExist "True"					
							REM .webCheckBox("AdvertPlacementsNotViewed").assertStatus "Visible"
							REM .webCheckBox("AdvertPlacementsNotViewed").assertStatus "Checked"
							
							
							REM .webCheckBox("TotalHomeViews").assertExist "True"					
							REM .webCheckBox("TotalHomeViews").assertStatus "Visible"
							REM .webCheckBox("TotalHomeViews").assertStatus "Checked"
							
							
							REM .webCheckBox("AdvertAveragePlayTime").assertExist "True"					
							REM .webCheckBox("AdvertAveragePlayTime").assertStatus "Visible"
							REM .webCheckBox("AdvertAveragePlayTime").assertStatus "Checked"
							
							
							REM .webCheckBox("TotalAdViews").assertExist "True"
							REM .webCheckBox("TotalAdViews").assertStatus "Visible"										
							REM .webCheckBox("TotalAdViews").assertStatus "Checked"
						   
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
			
							
							
			
End with


'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"