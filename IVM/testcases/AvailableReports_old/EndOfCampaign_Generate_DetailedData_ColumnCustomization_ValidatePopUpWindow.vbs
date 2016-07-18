'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"
'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
						 wait Wait10	
						 
								.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								 wait wait10
						
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
						end if
						
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait10
						

						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(DetailedData_page)

							.weblink("DetailedData").press
							 wait Wait5
							 
							
							
							.webTable("DetailedData_Header_EOC").assertExist "True"
							.webTable("DetailedData_Header_EOC").pressColumnCustomization 
							wait Wait5
							
							.webEdit("CustomizeSearch").assertExist "True"
					        .webEdit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DisplayedColumns").assertExist "True"
							.webElement("DisplayedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
							
							'NoColumnsToDisplay
							.webElement("NoColumnsToDisplay").assertExist "True"
							.webElement("NoColumnsToDisplay").assertStatus "Visible"
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						    REM .assertExistWE "Time Range","True"
							REM .assertExistWE "Element Number","True"
							REM .assertExistWE "Campaign Name","True"
							REM .assertExistWE "Clock Number","True"
							REM .assertExistWE "Program PID","True"
							REM .assertExistWE "Unique Customers","True"
							REM .assertExistWE "Advert Placements","True"
							REM .assertExistWE "Advert Full Views","True"
							REM .assertExistWE "Advert Partial Views","True"
							REM .assertExistWE "Advert Fast Forward Views","True"
							REM .assertExistWE "Advert Placements Not Viewed","True"
							REM .assertExistWE "Advert Average Play Time","True"
							REM .assertExistWE "Total Home Views","True"
							REM .assertExistWE "Total Ad Views","True"
							
						    
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
							
							
							
							.webCheckBox("UniqueCustomers").assertExist "True"					
							.webCheckBox("UniqueCustomers").assertStatus "Visible"
							.webCheckBox("UniqueCustomers").assertStatus "Checked"
							
							
							.webCheckBox("AdvertPlacements").assertExist "True"					
							.webCheckBox("AdvertPlacements").assertStatus "Visible"
							.webCheckBox("AdvertPlacements").assertStatus "Checked"
							
							
							.webCheckBox("AdvertFullViews").assertExist "True"					
							.webCheckBox("AdvertFullViews").assertStatus "Visible"
							.webCheckBox("AdvertFullViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertPartialViews").assertExist "True"					
							.webCheckBox("AdvertPartialViews").assertStatus "Visible"
							.webCheckBox("AdvertPartialViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertFastForwardViews").assertExist "True"					
							.webCheckBox("AdvertFastForwardViews").assertStatus "Visible"
							.webCheckBox("AdvertFastForwardViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertPlacementsNotViewed").assertExist "True"					
							.webCheckBox("AdvertPlacementsNotViewed").assertStatus "Visible"
							.webCheckBox("AdvertPlacementsNotViewed").assertStatus "Checked"
							
							
							.webCheckBox("TotalHomeViews").assertExist "True"					
							.webCheckBox("TotalHomeViews").assertStatus "Visible"
							.webCheckBox("TotalHomeViews").assertStatus "Checked"
							
							
							.webCheckBox("AdvertAveragePlayTime").assertExist "True"					
							.webCheckBox("AdvertAveragePlayTime").assertStatus "Visible"
							.webCheckBox("AdvertAveragePlayTime").assertStatus "Checked"
							
							
							.webCheckBox("TotalAdViews").assertExist "True"
							.webCheckBox("TotalAdViews").assertStatus "Visible"										
							.webCheckBox("TotalAdViews").assertStatus "Checked"
						   
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
			
							
							
			
End with


'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"