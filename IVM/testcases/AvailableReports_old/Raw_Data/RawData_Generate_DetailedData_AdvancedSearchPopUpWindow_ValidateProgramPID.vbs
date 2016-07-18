'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_035"

DataSet=testcasedata.getvalue("DataSet")
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


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with	

With ivm.page(detailedData_page)	

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webElement("ProgramPID_Adv").assertExist "True"
							.webElement("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_RD_ADV1 & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							 wait 2
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID1,"True"
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True" '''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False" '''all items deselected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"True"
							 wait 2
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPIDAll,"False"
							
							wait 2
							
							.webLink("AdvClearAll").press
							wait 2	
							
							strProgramPID=testcasedata.getvalue("strProgramPID")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							wait 2
							
							.webLink("AdvSearch").press
							wait 5
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webTable("DetailedData_RD").assertValue strProgramPID,"33"
							wait 5	
							.webTable("DetailedData_RD").assertDelValue strProgramPID1
							.webLink("ClearAll").press
							wait 5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RD").assertValue strProgramPID,"33"
							.webTable("DetailedData_RD").assertValue strProgramPID1,"33"
							
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_CSR_TC_035"