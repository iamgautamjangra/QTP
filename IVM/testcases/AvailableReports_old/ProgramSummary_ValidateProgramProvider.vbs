'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_ValidateProgramProvider
' Description					:	Validate the Regions list box available on the "ProgramPID Summary" report.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_ValidateProgramProvider", "REP_CSR_TC_007"

DataSet=testcasedata.getvalue("DataSet")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_PROGRAMSUMMARY
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportProgramSummary,3
							 wait Wait5

							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
							.webTable("DataSet").presstblRadioBtn DataSet,1
	
							wait Wait10
							
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_PS &";"&DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
                            .validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"							'''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_ValidateProgramProvider", "REP_CSR_TC_007"