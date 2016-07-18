'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_009"

DataSet=testcasedata.getvalue("DataSet")
strProgramPid=testcasedata.getvalue("strProgramPid")
strProgramPid1=testcasedata.getvalue("strProgramPid1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							wait 10
							
							
						    .webTable("DataSet").presstblRadioBtn DataSet,1 
							wait 5
							
							
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							.webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPid																									
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1
							 wait 2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"True"
							 wait 5
							 strProgramPid1=testcasedata.getvalue("strProgramPid1")
							.webEdit("ProgramPid").assertValue strProgramPid1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"False"
							 wait 5
							.webEdit("ProgramPid").assertValue "Type to search..."
							 wait 3	
																	
							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"
							.webEdit("CampaignNames").assertValue "Type to search..."
							.webEdit("CampaignNames").setValue strCampaign
							 wait 5
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							wait 2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 wait 5
							 strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("CampaignNames").assertValue strCampaign1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							 wait 5
							.webEdit("CampaignNames").assertValue "Type to search..."
							 wait 3						
							
End With
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_009"			
