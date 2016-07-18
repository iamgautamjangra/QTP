'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ADR_TC_030"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						 
							.webLink("AdvancedSearch").press
						    wait Wait3
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

							.weblink("DetailedData").press
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_AD_Adv").assertExist "True"
							.webEdit("ProgramPID_AD_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_AD & ";"& DataSet,""
							
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
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"
							
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
														
End with						  
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ADR_TC_030"