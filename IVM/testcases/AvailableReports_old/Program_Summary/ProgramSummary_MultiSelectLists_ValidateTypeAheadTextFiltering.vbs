'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_016"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 5

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportProgramSummary,3
							wait 10
							
							
						    .webTable("DataSet").presstblRadioBtn DataSet,1 
							wait 5
							
							
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							.webEdit("TimeRange").assertValue "Type to search..."
							.webEdit("TimeRange").setValue strTimeRange																									
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							 wait 2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait 2
							 strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.webEdit("TimeRange").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait 2
							.webEdit("TimeRange").assertValue "Type to search..."
							 	
																	
							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"
							.webEdit("CampaignNames").assertValue "Type to search..."
							.webEdit("CampaignNames").setValue strCampaign
							 
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							wait 2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 wait 2
							 strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("CampaignNames").assertValue strCampaign1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							 wait 2
							.webEdit("CampaignNames").assertValue "Type to search..."
							 					
							 
							 .webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							.webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPID
							 
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
							wait 2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait 2
							 strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("ProgramPid").assertValue strCampaign1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							 
							.webEdit("ProgramPid").assertValue "Type to search..."
							
							
End With

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_016"			
