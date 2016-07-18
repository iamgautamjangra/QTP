'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Program PID filter using advanced search.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_PSR_TC_044"

'DataSet=testcasedata.getvalue("DataSet")
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
DataSet=DATASET_PROGRAMSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
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
						wait wait10
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_PS & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True" '''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False" '''all items deselected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait Wait4
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False"
							
							wait Wait2
							
							.webLink("AdvClearAll").press
							wait Wait2	
							
							strProgramPID=testcasedata.getvalue("strProgramPID")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							wait Wait2
							
							.webLink("AdvSearch").press
							wait Wait5
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPIDAll)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPIDAll,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPIDAll &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_PS").assertExist "True"
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							
				
End with						  
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_PSR_TC_044"