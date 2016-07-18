'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Program PID filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_RDR_TC_020"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPid=testcasedata.getvalue("strProgramPid")
strProgramPid1=testcasedata.getvalue("strProgramPid1")
strProgramPidAll=testcasedata.getvalue("strProgramPidAll")

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

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
							.webTable("PreferredData_RD").assertExist "True"
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramPID_Adv").assertExist "True"							
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
					
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_RD_ADV &";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"True"
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True" '''all items selected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False" '''all items deselected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							strProgramPid=testcasedata.getvalue("strProgramPid")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False" 
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False"
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							
							wait Wait2
							.webLink("AdvSearch").press
							wait Wait7	
							
												
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPid)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPid,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPid &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							.webElement("ProgramPID_Filter").assertExist "True"					
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							
							
						
							
					
End with					
		
				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_RDR_TC_020"