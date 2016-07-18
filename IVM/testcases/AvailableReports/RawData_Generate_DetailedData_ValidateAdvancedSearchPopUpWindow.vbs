'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_033"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA
 
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait5

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
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

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
														
							.webElement("BindGUID_Adv").assertExist "True"
							.webElement("BindGUID_Adv").assertStatus "Visible"
							.webEdit("BindGUID_Adv").assertExist "True"
							.webEdit("BindGUID_Adv").assertStatus "Visible"
							
							.webElement("DeviceID_Adv").assertExist "True"
							.webElement("DeviceID_Adv").assertStatus "Visible"
							.webEdit("DeviceID_Adv").assertExist "True"
							.webEdit("DeviceID_Adv").assertStatus "Visible"
							
							.webElement("AdPID_Adv").assertExist "True"
							.webElement("AdPID_Adv").assertStatus "Visible"
							.webEdit("AdPID_Adv").assertExist "True"
							.webEdit("AdPID_Adv").assertStatus "Visible"
							
							.webElement("AdTitle_Adv").assertExist "True"
							.webElement("AdTitle_Adv").assertStatus "Visible"
							.webEdit("AdTitle_Adv").assertExist "True"
							.webEdit("AdTitle_Adv").assertStatus "Visible"
							
							.webElement("RegionName_Adv").assertExist "True"
							.webElement("RegionName_Adv").assertStatus "Visible"
							.webEdit("RegionName_Adv").assertExist "True"
							.webEdit("RegionName_Adv").assertStatus "Visible"
							
							.webElement("ElementNumber_Adv").assertExist "True"
							.webElement("ElementNumber_Adv").assertStatus "Visible"
							.webEdit("ElementNumber_Adv").assertExist "True"
							.webEdit("ElementNumber_Adv").assertStatus "Visible"
							
							.webElement("CampaignName_Adv").assertExist "True"
							.webElement("CampaignName_Adv").assertStatus "Visible"
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"
							
							.webElement("ClockNumber_Adv").assertExist "True"
							.webElement("ClockNumber_Adv").assertStatus "Visible"
							.webEdit("ClockNumber_Adv").assertExist "True"
							.webEdit("ClockNumber_Adv").assertStatus "Visible"
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							
							.webElement("ProgramPAID_Adv").assertExist "True"
							.webElement("ProgramPAID_Adv").assertStatus "Visible"
							.webEdit("ProgramPAID_Adv").assertExist "True"
							.webEdit("ProgramPAID_Adv").assertStatus "Visible"
							
							.webElement("ProgramTitle_Adv").assertExist "True"
							.webElement("ProgramTitle_Adv").assertStatus "Visible"
							.webEdit("ProgramTitle_RD_Adv").assertExist "True"
							.webEdit("ProgramTitle_RD_Adv").assertStatus "Visible"
																																			
													
											
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait Wait2
							
							.webLink("AdvCancel").press
							wait Wait5
							
End With

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_033"