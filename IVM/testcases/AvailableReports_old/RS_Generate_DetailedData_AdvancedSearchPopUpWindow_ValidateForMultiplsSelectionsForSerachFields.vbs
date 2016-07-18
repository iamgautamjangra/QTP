'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RSR_TC_049"
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
						   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"
							
							End If
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionName)>9 then 
							.webElement("RegionName_Filter").assertText  "Region Name ="& mid(strRegionName,1,8) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region Name ="& strRegionName &"   X"
							
							End If
							
							.webElement("RegionGroupName_Filter").assertExist "True"
							If len(strRegionGroupName)>9 then 
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& mid(strRegionGroupName,1,8) &".." &"   X"
							
							Else
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& strRegionGroupName &"   X"
							
							End If
							
							
							
							.webElement("TimeRange_Filter").assertExist "True"
							If len(strTimeRange)>9 then 
							.webElement("TimeRange_Filter").assertText  "Time Range ="& mid(strTimeRange,1,8) &".." &"   X"
							
							Else
							.webElement("TimeRange_Filter").assertText  "Time Range ="& strTimeRange &"   X"
							
							End If
							
							.webElement("CampaignName_Filter").assertExist "True"
							If len(strCampaignName)>9 then 
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& mid(strCampaignName,1,8) &".." &"   X"
							
							Else
							.webElement("CampaignName_Filter").assertText  "Campaign Name ="& strCampaignName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
							
						
							.webTable("DetailedData_RS").assertValue strRegionGroupName,"7"
							.webTable("DetailedData_RS").assertValue strElementNumber,"2"
							.webTable("DetailedData_RS").assertValue strTimeRange,"1"
							.webTable("DetailedData_RS").assertValue strCampaignName,"3"
							.webTable("DetailedData_RS").assertValue strClockNumber,"4"
							.webTable("DetailedData_RS").assertValue strRegionName,"6"
							
								
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName1
							REM .webTable("DetailedData_RS").assertDelValue strElementNumber1
							.webTable("DetailedData_RS").assertDelValue strTimeRange1
							.webTable("DetailedData_RS").assertDelValue strCampaignName1
							REM .webTable("DetailedData_RS").assertDelValue strClockNumber1
							.webTable("DetailedData_RS").assertDelValue strRegionName1
							
							.webLink("ClearAll").press
							wait Wait7
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
							

executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachFields", "REP_RSR_TC_049"