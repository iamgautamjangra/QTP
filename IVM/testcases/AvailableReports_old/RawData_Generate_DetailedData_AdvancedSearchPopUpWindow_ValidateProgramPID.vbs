'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_035"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA
With ivm.page(report_page)
							.webTable("AvailableReports").presstblLink reportRawData,3
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
						
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(detailedData_page)	

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_RD_ADV1 & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"True"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"True"
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True" '''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False" '''all items deselected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False"
							
							wait Wait2
							
							.webLink("AdvClearAll").press
							wait Wait2	
							
							strProgramPID=testcasedata.getvalue("strProgramPID")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							wait Wait2
							
							.webLink("AdvSearch").press
							wait Wait5
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_035"