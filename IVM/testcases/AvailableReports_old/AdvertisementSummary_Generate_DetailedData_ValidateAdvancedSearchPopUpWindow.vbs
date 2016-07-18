'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ASR_TC_040"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7
						
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
							.webLink("AdvancedSearch").press
							wait Wait3
							
							.webElement("SearchTerm_Adv").assertExist "True"
							.webElement("SearchTerm_Adv").assertStatus "Visible"
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "Visible"
							.webEdit("SearchTerm_Adv").assertValue "Search..."
							
							.webElement("ElementNumber_Adv").assertExist "True"
							.webElement("ElementNumber_Adv").assertStatus "Visible"
							.webEdit("ElementNumber_AS_Adv").assertExist "True"
							.webEdit("ElementNumber_AS_Adv").assertStatus "Visible"
						
							.webElement("CampaignName_Adv").assertExist "True"
							.webElement("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_AS_Adv").assertExist "True"
							.webEdit("CampaignName_AS_Adv").assertStatus "Visible"
							
							.webElement("ClockNumber_Adv").assertExist "True"
							.webElement("ClockNumber_Adv").assertStatus "Visible"
							.webEdit("ClockNumber_AS_Adv").assertExist "True"
							.webEdit("ClockNumber_AS_Adv").assertStatus "Visible"
							
							.webElement("ProgramProvider_Adv").assertExist "True"
							.webElement("ProgramProvider_Adv").assertStatus "Visible"
							.webEdit("ProgramProvider_Adv").assertExist "True"
							.webEdit("ProgramProvider_Adv").assertStatus "Visible"
							
							
							.webElement("AdTitle_Adv").assertExist "True"
							.webElement("AdTitle_Adv").assertStatus "Visible"
							.webEdit("AdTitle_AS_Adv").assertExist "True"
							.webEdit("AdTitle_AS_Adv").assertStatus "Visible"
							
						
							.webElement("TimeRange_Adv").assertExist "True"
							.webElement("TimeRange_Adv").assertStatus "Visible"
							.webEdit("TimeRange_AS_Adv").assertExist "True"
							.webEdit("TimeRange_AS_Adv").assertStatus "Visible"
							
														
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							
							
							.webLink("AdvCancel").press
							
                           
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ASR_TC_040"