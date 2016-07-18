'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_RSR_TC_051"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strRegionGroupName=testcasedata.getvalue("strRegionGroupName")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strRegionName=testcasedata.getvalue("strRegionName")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
							
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.webEdit("RegionGroupName_Adv").setValue strRegionGroupName
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("RegionName_Adv").setValue strRegionName
						   
							.webLink("AdvClearAll").press							  
							  wait Wait2
							
							.webEdit("ElementNumber_Adv").assertvalue ""
							
							.webEdit("ClockNumber_Adv").assertvalue ""
							
							.webEdit("RegionGroupName_Adv").assertvalue ""
							
							.webEdit("RegionName_Adv").assertvalue ""
							 wait Wait3
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
							 wait Wait3
							 REM .webEdit("CampaignName_Adv").assertValue "Type to search..."
							 
				            .webEdit("ClockNumber").assertValue ""
							 wait Wait3
							 .validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							 wait Wait3
							REM .webEdit("TimeRange_Adv").assertValue "Type to search..."
							
													
						   						
							
End with

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_RSR_TC_051"