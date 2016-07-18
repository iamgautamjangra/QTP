'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateControls
' Description					:	Validate the UI controls of the customized column popup on the Detailed data tab of the "Advertisement And Program Details" Report.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateControls", "REP_APD_TC_041"


DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

DataSet=DATASET_ADPROGRAMDETAILS

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							wait Wait10	
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3

							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8

							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							wait 1
							.webLink("AdvSearch").press
							wait Wait3
							End if
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait10


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
							 
							
							
							.webTable("DetailedData_APD").assertExist "True"
							.webTable("DetailedData_Header_APD").pressColumnCustomization 
							wait Wait5
							
							.webEdit("CustomizeSearch").assertExist "True"
					        .webEdit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DisplayedColumns").assertExist "True"
							.webElement("DisplayedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
							
							REM NoColumnsToDisplay
							.webElement("NoColumnsToDisplay").assertExist "True"
							.webElement("NoColumnsToDisplay").assertStatus "Visible"
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						    .assertExistWE "Time Range","True"
							.assertExistWE "Campaign Name","True"
							.assertExistWE "Element Number","True"
							.assertExistWE "Clock Number","True"
							.assertExistWE "Program PID","True"
							.assertExistWE "Program PAID","True"
							.assertExistWE "Channel","True"
							.assertExistWE "Program Title","True"
							.assertExistWE "Program Series Title","True"
							.assertExistWE "Program Episode Title","True"
							.assertExistWE "Program Episode ID","True"
							.assertExistWE "Program Placement Count","True"
							.assertExistWE "Program Views","True"
							.assertExistWE "Program Partial Views","True"
							REM '.assertExistWE "Region Name","True"
							REM '.assertExistWE "Region Group Name","True"
							.assertExistWE "Ad Title","True"
							.assertExistWE "UniCampaign1000-245.248ue Customers","True"
							.assertExistWE "Advert Placement Count","True"
							.assertExistWE "Advert Full Views","True"
							.assertExistWE "Advert Partial Views","True"
							.assertExistWE "Advert Fast Forward Views","True"
							.assertExistWE "Advert Placements Not Viewed","True"
							.assertExistWE "Total Home Views","True"
							.assertExistWE "Advert Average Play Time","True"
							.assertExistWE "Total Ad Views","True"
							
						    
							.webCheckBox("TimeRange").assertExist "True"					
							.webCheckBox("TimeRange").assertStatus "Visible"
							.webCheckBox("TimeRange").assertStatus "Checked"
							.webCheckBox("TimeRange").assertStatus "Disabled"
							
							.webCheckBox("ElementNumber").assertExist "True"					
							.webCheckBox("ElementNumber").assertStatus "Visible"
							.webCheckBox("ElementNumber").assertStatus "Checked"
							REM .webCheckBox("ElementNumber").assertStatus "Disabled"
						
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
							REM .webCheckBox("ProgramPID").assertStatus "Disabled"
							
							
							.webCheckBox("UniCampaign1000-245.248ueCustomers").assertExist "True"					
							.webCheckBox("UniCampaign1000-245.248ueCustomers").assertStatus "Visible"
							.webCheckBox("UniCampaign1000-245.248ueCustomers").assertStatus "Checked"
							
							
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
						    .webCheckBox("TotalAdViews").assertStatus "Disabled"
						  
'---------------Assert webbutton generate------------------------------------------------

							.webLink("CustomizeApply").assertExist "True"
							.webLink("CustomizeApply").assertStatus "Visible"


'---------------Assert webbutton Cancel--------------------------------------------------

							.webLink("CustomizeCancel").assertExist "True"
							.webLink("CustomizeCancel").assertStatus "Visible"
							
							.webLink("CustomizeCancel").press
			
							
							
			
End with


'End Test Case 

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ColumnCustomizationWindow_ValidateControls", "REP_APD_TC_041"