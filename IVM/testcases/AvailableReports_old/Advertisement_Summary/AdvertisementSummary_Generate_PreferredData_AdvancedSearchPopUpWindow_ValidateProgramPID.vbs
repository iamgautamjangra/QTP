'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID
' Description					:	Validate the Campaign Name filter on advanced search window
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ASR_TC_027"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7
 
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_PROGRAMPID_AS & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							 wait 2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True" '''all items selected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False" '''all items deselected function
							
							strProgramPIDAll=testcasedata.getvalue("strProgramPIDAll")
							strProgramPID=testcasedata.getvalue("strProgramPID")
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"True"
							 wait 4
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPIDAll,"False"
							
							wait 2
							
							.webLink("AdvClearAll").press
							wait 2	
							
							strProgramPID=testcasedata.getvalue("strProgramPID")
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							wait 2
							
							.webLink("AdvSearch").press
							wait 5
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramProvider_Filter").assertText  "Program Provider ="& mid(strProgramPID,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramProvider_Filter").assertText  "Program Provider ="& strProgramPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_AS").assertExist "True"
							
						
							.webTable("PreferredData_AS").assertValue strProgramPID,"4"
							wait 5	
							.webTable("PreferredData_AS").assertDelValue strProgramPID1
							.webLink("ClearAll").press
							wait 5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							
							.webTable("PreferredData_AS").assertValue strProgramPID,"4"
							.webTable("PreferredData_AS").assertValue strProgramPID1,"4"
							
End with						  
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateProgramPID", "REP_ASR_TC_027"