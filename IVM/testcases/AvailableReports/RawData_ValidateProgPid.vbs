'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_ValidateProgPid
' Description					:	Validate the Regions list box available on the "Raw data" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_ValidateProgPid", "REP_CSR_TC_006"

'DataSet=testcasedata.getvalue("DataSet")
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
							
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_RD &";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"True"
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"True" '''all items selected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"False" '''all items deselected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							strProgramPid=testcasedata.getvalue("strProgramPid")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPidAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_ValidateProgPid", "REP_CSR_TC_006"