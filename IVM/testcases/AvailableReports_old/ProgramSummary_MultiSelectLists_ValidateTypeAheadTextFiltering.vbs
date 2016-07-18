'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_016"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")

DataSet=DATASET_PROGRAMSUMMARY
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
with ivm.page(report_page)

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
						wait Wait10
							
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							.webEdit("TimeRange").assertValue "Type to search..."
							.webEdit("TimeRange").setValue strTimeRange																									
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							 wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait Wait2
							 strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.webEdit("TimeRange").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait2
						
						
							 	
																	
							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"
							.webEdit("CampaignNames").assertValue "Type to search..."
							.webEdit("CampaignNames").setValue strCampaign
							 
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 wait Wait2
							 strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("CampaignNames").assertValue strCampaign1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							 wait Wait2
						
						
							 					
							 
							 .webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							.webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPID
							 
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
							wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait Wait2
							 strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("ProgramPid").assertValue strProgramPID1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							wait wait2
						
							
							
End With

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_016"			
