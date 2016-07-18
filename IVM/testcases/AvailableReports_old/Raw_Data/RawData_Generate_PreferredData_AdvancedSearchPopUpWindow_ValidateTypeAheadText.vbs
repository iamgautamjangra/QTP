'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_RDR_TC_022"

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
							wait 4
							
							.webTable("PreferredData_RD").assertExist "True"
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramPID_Adv").assertExist "True"							
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."																							
							.webEdit("ProgramPID_Adv").setValue strProgramPid																								
							.assertListSearch MULTI_LIST_PROGRAMPID_ADV,strProgramPid
                            wait 5	
							.selectlistItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"True"
							wait 5
							strProgramPid1=testcasedata.getvalue("strProgramPid1")
							.webEdit("ProgramPID_Adv").assertValue strProgramPid1
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid1,"False"
							 wait 3
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."
							 wait 3
							  											
                            .webLink("AdvCancel").press							  
							
End with

					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_RDR_TC_022"