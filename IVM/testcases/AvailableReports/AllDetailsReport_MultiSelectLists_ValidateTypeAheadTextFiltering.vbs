'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AllDetailsReport_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Type ahead search for multiselect list.
' Author 						:   Fonantrix Solution
' Date 							: 08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_ADR_TC_017"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait5
DataSet=DATASET_ALLDETAILS
with ivm.page(report_page)

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
							
							
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							REM .webEdit("TimeRange").assertValue "Type to search..."
							.webEdit("TimeRange").setValue strTimeRange																									
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							 wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait Wait5
							 
							.webEdit("TimeRange").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait5
							REM .webEdit("TimeRange").assertValue "Type to search..."
							 wait Wait3	
																	
							.webEdit("CampaignNames").assertExist "True"
							.webEdit("CampaignNames").assertStatus "Visible"
							REM .webEdit("CampaignNames").assertValue "Type to search..."
							.webEdit("CampaignNames").setValue strCampaign
							 wait Wait5
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							 wait Wait5
							 
							.webEdit("CampaignNames").assertValue strCampaign1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							 wait Wait5
							REM .webEdit("CampaignNames").assertValue "Type to search..."
							 wait Wait3						
							 
							 .webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							REM .webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPID
							 wait Wait5
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1
							wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							 wait Wait5
							.webEdit("ProgramPid").assertValue strProgramPID1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							 wait Wait5
							REM .webEdit("ProgramPid").assertValue "Type to search..."
							
End With

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_ADR_TC_017"			
