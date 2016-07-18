'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_017"

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
With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 5
							
							.webLink("AdvancedSearch").press
							wait 3
							
							.webElement("SearchTerm_Adv").assertExist "True"
							.webElement("SearchTerm_Adv").assertStatus "Visible"
							.webEdit("SearchTerm_Adv").assertExist "True"
							.webEdit("SearchTerm_Adv").assertStatus "Visible"
							
							.webElement("ElementNumber_Adv").assertExist "True"
							.webElement("ElementNumber_Adv").assertStatus "Visible"
							.webEdit("ElementNumber_Adv").assertExist "True"
							.webEdit("ElementNumber_Adv").assertStatus "Visible"
							
							.webElement("ClockNumber_Adv").assertExist "True"
							.webElement("ClockNumber_Adv").assertStatus "Visible"
							.webEdit("ClockNumber_Adv").assertExist "True"
							.webEdit("ClockNumber_Adv").assertStatus "Visible"
							
							.webElement("DeviceId_Adv").assertExist "True"
							.webElement("DeviceId_Adv").assertStatus "Visible"
							.webEdit("DeviceId_Adv").assertExist "True"
							.webEdit("DeviceId_Adv").assertStatus "Visible"
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							
							.webElement("Channel_Adv").assertExist "True"
							.webElement("Channel_Adv").assertStatus "Visible"
							.webEdit("Channel_Adv").assertExist "True"
							.webEdit("Channel_Adv").assertStatus "Visible"
														
							.webElement("ViewDate").assertExist "True"
							.webElement("ViewDate").assertStatus "Visible"
														
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
							
							.webLink("AdvSearch").assertExist "True"
							.webLink("AdvSearch").assertStatus "Visible"
							
							.webLink("AdvCancel").assertExist "True"
							.webLink("AdvCancel").assertStatus "Visible"
							
							.webLink("AdvClearAll").assertExist "True"
							.webLink("AdvClearAll").assertStatus "Visible"
							wait 2
							
							.webLink("AdvCancel").press
							
End With

					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_ValidateAdvancedSearchPopUpWindow", "REP_CSR_TC_017"