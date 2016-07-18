'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_APD_TC_039"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
strAdTitle=testcasedata.getvalue("strAdTitle")
strClockNumber=testcasedata.getvalue("strClockNumber")
strChannel=testcasedata.getvalue("strChannel")
strProgramTitle=testcasedata.getvalue("strProgramTitle")


status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
Wait 7
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
							wait 1
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

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							wait Wait2
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							.webEdit("ProgramTitle_APD_Adv").setValue strProgramTitle
							
							
							.webLink("AdvClearAll").press							  
							  wait Wait2
							
							.webEdit("ElementNumber_Adv").assertvalue ""
							.webEdit("AdTitle_Adv").assertvalue ""		
							
							 REM .validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							
							.webEdit("TimeRange_AD_Adv").assertValue "Type to search..."
						
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
						
							 .webEdit("CampaignName_Adv").assertValue "Type to search..."
							 
				            .webEdit("ClockNumber_Adv").assertValue ""
							
							 .validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							 
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."
							
																				
						
							.webLink("AdvCancel").press
							
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_APD_TC_039"