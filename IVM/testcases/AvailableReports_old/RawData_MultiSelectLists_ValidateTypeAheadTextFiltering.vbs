'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Functionality of "Type Ahead Text".
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_009"

'DataSet=testcasedata.getvalue("DataSet")
strProgramPid=testcasedata.getvalue("strProgramPid")
strProgramPid1=testcasedata.getvalue("strProgramPid1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA
with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
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
							
							
							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							.webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPid																									
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1
							 wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"True"
							 wait Wait5
							 strProgramPid1=testcasedata.getvalue("strProgramPid1")
							.webEdit("ProgramPid").assertValue strProgramPid1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid1,"False"
							 wait Wait5
							REM .webEdit("ProgramPid").assertValue "Type to search..."
							 REM wait Wait3	
																	
							REM .webEdit("CampaignNames").assertExist "True"
							REM .webEdit("CampaignNames").assertStatus "Visible"
							REM .webEdit("CampaignNames").assertValue "Type to search..."
							REM .webEdit("CampaignNames").setValue strCampaign
							 REM wait Wait5
							REM .assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							REM wait Wait2
							REM .selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 REM wait Wait5
							 REM strCampaign1=testcasedata.getvalue("strCampaign1")
							REM .webEdit("CampaignNames").assertValue strCampaign1
							REM .selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							 REM wait Wait5
							REM .webEdit("CampaignNames").assertValue "Type to search..."
							 REM wait Wait3						
							
End With
'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "RawData_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_CSR_TC_009"			
