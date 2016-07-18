'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"



strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_PROGRAMSUMMARY

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait5	
						 
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
		
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							 wait Wait5
							 
							
							.webLink("AdvancedSearch").press
							  wait Wait5
							  
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"							 
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName
                            wait Wait2
							.selectlistItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							wait Wait2
							
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"False"
							 wait Wait2
							
							
							 
							 .webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait Wait2
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							wait Wait5
							
							.webEdit("TimeRange_Adv").assertValue strTimeRange1
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait2
							
							 
							 
							  .webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"							 
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."																							
							.webEdit("ProgramPID_Adv").setValue strProgramPID																								
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
                            wait Wait2
							.selectlistItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							wait Wait2
							
							.webEdit("ProgramPID_Adv").assertValue strProgramPID1
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							 wait Wait2
							
								


							.webLink("AdvCancel").press							  
							
						  	
							
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_CSR_TC_039"