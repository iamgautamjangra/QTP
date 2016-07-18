'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
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
							.webTable("DetailedData_Header_PS").pressColumnCustomization 
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
							.assertExistWE "Clock Number","True"
							.assertExistWE "Program PID","True"
							.assertExistWE "Program PAID","True"
							.assertExistWE "Channel","True"
							.assertExistWE "Program Title","True"
							.assertExistWE "Unique Customers","True"
							.assertExistWE "Program Series Title","True"
							.assertExistWE "Advert Placements","True"
							.assertExistWE "Advert Full Views","True"
							.assertExistWE "Advert Partial Views","True"
							.assertExistWE "Advert Fast Forward Views","True"
							.assertExistWE "Advert Placements Not Viewed","True"
							.assertExistWE "Total Home Views","True"
							.assertExistWE "Total Ad Views","True"
							
						    
							.webCheckBox("TimeRange").assertExist "True"					
							.webCheckBox("TimeRange").assertStatus "Visible"
							.webCheckBox("TimeRange").assertStatus "Checked"
							.webCheckBox("TimeRange").assertStatus "Disabled"
							
							.webCheckBox("ElementNumber").assertExist "True"					
							.webCheckBox("ElementNumber").assertStatus "Visible"
							.webCheckBox("ElementNumber").assertStatus "Checked"
							.webCheckBox("ElementNumber").assertStatus "Disabled"
						
							.webCheckBox("CampaignName").assertExist "True"
							.webCheckBox("CampaignName").assertStatus "Visible"										
							.webCheckBox("CampaignName").assertStatus "Checked"
							.webCheckBox("CampaignName").assertStatus "Disabled"
														
							.webCheckBox("ClockNumber").assertExist "True"					
							.webCheckBox("ClockNumber").assertStatus "Visible"
							.webCheckBox("ClockNumber").assertStatus "Checked"
							
							
							.webCheckBox("ProgramPID").assertExist "True"
							.webCheckBox("ProgramPID").assertStatus "Visible"										
							.webCheckBox("ProgramPID").assertStatus "Checked"
							.webCheckBox("ProgramPID").assertStatus "Disabled"
							
							
							.webCheckBox("UniqueCustomers").assertExist "True"					
							.webCheckBox("UniqueCustomers").assertStatus "Visible"
							.webCheckBox("UniqueCustomers").assertStatus "Checked"
							
							
							.webCheckBox("AdvertPlacements").assertExist "True"					
							.webCheckBox("AdvertPlacements").assertStatus "Visible"
							.webCheckBox("AdvertPlacements").assertStatus "Checked"
							
							
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
 executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"