'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_APD_TC_035"

DataSet=testcasedata.getvalue("DataSet")
'strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADPROGRAMDETAILS

With ivm.page(report_page)

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
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
							End if
							.webTable("DataSet").presstblRadioBtn DataSet,1

							wait Wait10

							.webEdit("EmailRecipients").setValue strEmail

							.webEdit("StorageLocation").setValue strStorageLocation

							.webList("ReportFormat").selectItem strReportFormat

							.webList("DataType").selectItem strDataType

							.webEdit("Comments").setValue strComments
							.webButton("Generate").press
							wait Wait10
End with 
	

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							 wait Wait5
							 
							
							.webLink("AdvancedSearch").press
							  wait Wait5
							  
							  
							.webEdit("CampaignName_Adv").assertExist "True"
							.webEdit("CampaignName_Adv").assertStatus "Visible"							 
							.webEdit("CampaignName_Adv").assertValue "Type to search..."																							
							.webEdit("CampaignName_Adv").setValue strCampaignName																								
							.assertListSearch MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName
                            wait Wait5
							.selectlistItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							
							
							.webEdit("CampaignName_Adv").assertValue strCampaignName1
						
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"False"
							
							
							.webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait Wait5
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						
							
							.webEdit("TimeRange_Adv").assertValue strTimeRange1
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
													
							 
							.webEdit("ProgramPID_Adv").assertExist "True"
							.webEdit("ProgramPID_Adv").assertStatus "Visible"							 
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."																							
							.webEdit("ProgramPID_Adv").setValue strProgramPID																								
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
                            wait Wait5
							.selectlistItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							
							
							.webEdit("ProgramPID_Adv").assertValue strProgramPID1
						
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							
							.webLink("AdvCancel").press	

End With
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_APD_TC_035"