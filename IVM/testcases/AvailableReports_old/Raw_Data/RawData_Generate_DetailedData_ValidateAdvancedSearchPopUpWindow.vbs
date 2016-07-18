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

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10
 
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 5
							.webLink("AdvancedSearch").press
							wait 3
							
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
							.webEdit("ProgramTitle_Adv").assertExist "True"
							.webEdit("ProgramTitle_Adv").assertStatus "Visible"
																																			
							.webElement("Between").assertExist "True"
							.webElement("Between").assertStatus "Visible"
							.webEdit("Between").assertExist "True"
							.webEdit("Between").assertStatus "Visible"
							.webImage("Between").assertExist "True"
							.webImage("Between").assertStatus "Visible"
							
							.webElement("And").assertExist "True"
							.webElement("And").assertStatus "Visible"
							.webEdit("And").assertExist "True"
							.webEdit("And").assertStatus "Visible"
							.webImage("And").assertExist "True"
							.webImage("And").assertStatus "Visible"
							
							.webElement("CampaignStartDate_Adv").assertExist "True"
							.webElement("CampaignStartDate_Adv").assertStatus "Visible"
							.webEdit("Between2").assertExist "True"
							.webEdit("Between2").assertStatus "Visible"
							.webImage("Between2").assertExist "True"
							.webImage("Between2").assertStatus "Visible"
							
							'.webElement("CampaignEndDate_Adv").assertExist "True"
							'.webElement("CampaignEndDate_Adv").assertStatus "Visible"
							'.webEdit("CampaignEndDate_Adv").assertExist "True"
							'.webEdit("CampaignEndDate_Adv").assertStatus "Visible"
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							wait 5
							
End With

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_033"