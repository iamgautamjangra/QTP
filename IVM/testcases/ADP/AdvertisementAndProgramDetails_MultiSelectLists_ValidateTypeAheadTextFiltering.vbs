'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Type ahead search for multiselect list.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_APD_TC_019"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait5
DataSet=DATASET_ADPROGRAMDETAILS
with ivm.page(report_page)
							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							wait Wait10
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3

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

							.webEdit("TimeRange_APD").assertExist "True"
							.webEdit("TimeRange_APD").assertStatus "Visible"
							.webEdit("TimeRange_APD").assertValue "Type to search..."
							.webEdit("TimeRange_APD").setValue strTimeRange
 								wait Wait2
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							wait Wait5
							strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.webEdit("TimeRange_APD").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							wait Wait5
								

							.webEdit("CampaignNames_APD").assertExist "True"
							.webEdit("CampaignNames_APD").assertStatus "Visible"
							.webEdit("CampaignNames_APD").assertValue "Type to search..."
							.webEdit("CampaignNames_APD").setValue strCampaign
							wait Wait5
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign
							wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
							wait Wait5
							strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("CampaignNames_APD").assertValue strCampaign1
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"False"
							wait Wait5
													

							.webEdit("ProgramPid").assertExist "True"
							.webEdit("ProgramPid").assertStatus "Visible"
							.webEdit("ProgramPid").assertValue "Type to search..."
							.webEdit("ProgramPid").setValue strProgramPID
							wait Wait5
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
							wait Wait2
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							wait Wait5
							strCampaign1=testcasedata.getvalue("strCampaign1")
							.webEdit("ProgramPid").assertValue strProgramPID1
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							wait Wait5
							


End With

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_APD_TC_019"			
