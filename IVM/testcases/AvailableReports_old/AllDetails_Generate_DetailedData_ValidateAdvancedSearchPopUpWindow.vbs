'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetails_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UI Controls of "Advance Search" popup window.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetails_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ADR_TC_024"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						 
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
							.webEdit("ElementNumber_Adv").assertExist "True"
							.webEdit("ElementNumber_Adv").assertStatus "Visible"
						
							.webElement("CampaignName_Adv").assertExist "True"
							.webElement("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							
							.webElement("RegionName_Adv").assertExist "True"
							.webElement("RegionName_Adv").assertStatus "Visible"
							.webEdit("RegionName_Adv").assertExist "True"
							.webEdit("RegionName_Adv").assertStatus "Visible"
							
							.webElement("ClockNumber_Adv").assertExist "True"
							.webElement("ClockNumber_Adv").assertStatus "Visible"
							.webEdit("ClockNumber_Adv").assertExist "True"
							.webEdit("ClockNumber_Adv").assertStatus "Visible"
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_AD_Adv").assertExist "True"
							.webEdit("ProgramPID_AD_Adv").assertStatus "Visible"
							
							
							.webElement("ProgramTitle_Adv").assertExist "True"
							.webElement("ProgramTitle_Adv").assertStatus "Visible"
							.webEdit("ProgramTitle_AD_Adv").assertExist "True"
							.webEdit("ProgramTitle_AD_Adv").assertStatus "Visible"
							
							.webElement("Channel_Adv").assertExist "True"
							.webElement("Channel_Adv").assertStatus "Visible"
							.webEdit("Channel_AD_Adv").assertExist "True"
							.webEdit("Channel_AD_Adv").assertStatus "Visible"
							
							.webElement("AdTitle_Adv").assertExist "True"
							.webElement("AdTitle_Adv").assertStatus "Visible"
							.webEdit("AdTitle_Adv").assertExist "True"
							.webEdit("AdTitle_Adv").assertStatus "Visible"
							
						
							.webElement("TimeRange_Adv").assertExist "True"
							.webElement("TimeRange_Adv").assertStatus "Visible"
							.webEdit("TimeRange_AD_Adv").assertExist "True"
							.webEdit("TimeRange_AD_Adv").assertStatus "Visible"
							
														
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							
							
							.webLink("AdvCancel").press
							
                           
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetails_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_ADR_TC_024"