'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate Cancel operation on advanced search
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RSR_TC_050"
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
strRegionGroupName1=testcasedata.getvalue("strRegionGroupName1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strRegionName=testcasedata.getvalue("strRegionName")
strRegionName1=testcasedata.getvalue("strRegionName1")

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
						   
							.webLink("AdvCancel").press							  
							  wait Wait5
							  
							 .webElement("RegionGroupName_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							  	
							.webTable("DetailedData_RS").assertValue strRegionGroupName1,"7"
							.webTable("DetailedData_RS").assertValue strElementNumber1,"2"
							.webTable("DetailedData_RS").assertValue strTimeRange1,"1"
							.webTable("DetailedData_RS").assertValue strCampaignName1,"3"
							.webTable("DetailedData_RS").assertValue strClockNumber1,"4"
							.webTable("DetailedData_RS").assertValue strRegionName1,"6"
End with
				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RSR_TC_050"