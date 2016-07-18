'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText
' Description					:	Validate the type ahead search in the advanced search multiselect listbox.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_ASR_TC_029"

'DataSet=testcasedata.getvalue("DataSet")
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

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							 wait Wait5
							 
							
							.webLink("AdvancedSearch").press
							  wait Wait5
							  
							
							 .webEdit("TimeRange_AS_Adv").assertExist "True"
							.webEdit("TimeRange_AS_Adv").assertStatus "Visible"							 
							.webEdit("TimeRange_AS_Adv").assertValue "Type to search..."																							
							.webEdit("TimeRange_AS_Adv").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait 15
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							wait Wait5
							
							.webEdit("TimeRange_AS_Adv").assertValue strTimeRange1
							wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait5
							'.webEdit("TimeRange_AS_Adv").assertValue "Type to search..."
							 wait Wait3	
							 
							 .webEdit("ProgramProvider_Adv").assertExist "True"
							.webEdit("ProgramProvider_Adv").assertStatus "Visible"							 
							.webEdit("ProgramProvider_Adv").assertValue "Type to search..."																							
							.webEdit("ProgramProvider_Adv").setValue strProgramPID																								
							.assertListSearch MULTI_LIST_PROGRAMPID_AVAI,strProgramPID
                            wait 15
							.selectlistItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
							wait Wait5
							
							.webEdit("ProgramProvider_Adv").assertValue strProgramPID1
							wait Wait5
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
							 wait Wait5
						'	.webEdit("ProgramProvider_Adv").assertValue "Type to search..."
							 wait Wait3	


							.webLink("AdvCancel").press							  
							
						  	
							
End with
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTypeAheadText", "REP_ASR_TC_029"