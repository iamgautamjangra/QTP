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

DataSet=testcasedata.getvalue("DataSet")
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

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10
 
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							'.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
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
							wait 4
							
							.webTable("PreferredData_RD").assertExist "True"
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramPID_Adv").assertExist "True"							
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
					
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_RD_ADV &";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							 wait 5
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"True"
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True" '''all items selected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False" '''all items deselected function
							
							strProgramPidAll=testcasedata.getvalue("strProgramPidAll")
							strProgramPid=testcasedata.getvalue("strProgramPid")
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False" 
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPidAll,"False"
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							
							wait 2
							.webLink("AdvSearch").press
							wait 7	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPid)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPid,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPid &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
						
							.webTable("PreferredData_RD").assertValue strProgramPid,"9"
								
							.webTable("PreferredData_RD").assertDelValue strProgramPid1
							.webLink("ClearAll").press
							wait 5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							
							.webTable("PreferredData_RD").assertValue strProgramPid1,"9"
						
							
					
End with					
		
				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_RDR_TC_020"