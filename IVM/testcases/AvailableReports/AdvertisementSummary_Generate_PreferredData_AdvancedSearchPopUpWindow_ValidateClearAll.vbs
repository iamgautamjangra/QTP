'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate Clear all operation on advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_ASR_TC_033"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strTimeRange=testcasedata.getvalue("strTimeRange")
strClockNumber=testcasedata.getvalue("strClockNumber")
strElementNumber=testcasedata.getvalue("strElementNumber")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7
						
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
						
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.webEdit("ElementNumber_Adv").setValue strElementNumber
						   
						.webLink("AdvClearAll").press
						wait Wait5
					
						.webEdit("ElementNumber_Adv").assertValue ""
						.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
						'.webEdit("TimeRange_AS_Adv").assertValue "Type to search..."
						
						.webEdit("ClockNumber_Adv").assertValue ""
						
						.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
						'.webEdit("ProgramProvider_Adv").assertValue "Type to search..."
						
					
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_ASR_TC_033"