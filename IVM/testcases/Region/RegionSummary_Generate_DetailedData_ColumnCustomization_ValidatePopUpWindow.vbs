'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow
' Description					:	Validate the UI controls of the Customized columns window.
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

DataSet=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait8
						end if
						.webTable("DataSet").presstblRadioBtn DataSet,1

						wait Wait10
						
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	
	

With ivm.page(detailedData_page)	

						.webLink("DetailedData").press
						wait Wait5
							
							.webTable("DetailedData_RS").assertExist "True"
							.webTable("DetailedData_Header_RS").pressColumnCustomization 
							wait Wait5
							
							.webEdit("CustomizeSearch").assertExist "True"
					        .webEdit("CustomizeSearch").assertStatus "Visible"
					
					
'---------------Assert header-----------------------------------------

							.webElement("DisplayedColumns").assertExist "True"
							.webElement("DisplayedColumns").assertStatus "Visible"

							.webElement("AvailableColumns").assertExist "True"
							.webElement("AvailableColumns").assertStatus "Visible"
							
							''NoColumnsToDisplay
							.webElement("NoColumnsToDisplay").assertExist "True"
							.webElement("NoColumnsToDisplay").assertStatus "Visible"
'---------------Assert Checkbox under Displayed columns----------------------------------------
						   
						    .assertExistWE "Time Range","True"
							.assertExistWE "Element Number","True"
							.assertExistWE "Campaign Name","True"
							.assertExistWE "Clock Number","True"
							.assertExistWE "Region ID","True"
							.assertExistWE "Region Name","True"
							.assertExistWE "Region Group Name","True"
							.assertExistWE "Advert Placement Count","True"
							.assertExistWE "Advert Full Views","True"
							.assertExistWE "Advert Partial Views","True"
							
							.assertExistWE "Advert Fast Forward Views","True"
							.assertExistWE "Advert Placements Not Viewed","True"
							.assertExistWE "Total Home Views","True"
							.assertExistWE "Advert Average Play Time ","True"
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
 executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_ColumnCustomization_ValidatePopUpWindow", "REP_CSR_TC_044"