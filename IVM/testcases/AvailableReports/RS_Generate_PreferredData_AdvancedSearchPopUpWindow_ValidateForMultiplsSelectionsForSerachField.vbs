'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_RSR_TC_031"
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
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strRegionName=testcasedata.getvalue("strRegionName")
strRegionName1=testcasedata.getvalue("strRegionName1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")


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
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.webEdit("RegionName_Adv").setValue strRegionName
						   
							.webLink("AdvSearch").press
							
							wait Wait5
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionName)>9 then 
							.webElement("RegionName_Filter").assertText  "Region Name ="& mid(strRegionName,1,8) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region Name ="& strRegionName &"   X"
							
							End If
							
							
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,8) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
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
							
							.webTable("PreferredData_PS").assertExist "True"
							
						
							.webTable("PreferredData_PS").assertValue strElementNumber,"2"
							.webTable("PreferredData_PS").assertValue strRegionName,"4"
							.webTable("PreferredData_PS").assertValue strTimeRange,"1"
							.webTable("PreferredData_PS").assertValue strCampaignName,"3"
							
							wait Wait5	
							REM .webTable("PreferredData_PS").assertDelValue strElementNumber1
							.webTable("PreferredData_PS").assertDelValue strRegionName1
							.webTable("PreferredData_PS").assertDelValue strTimeRange1
							.webTable("PreferredData_PS").assertDelValue strCampaignName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							
							
							.webTable("PreferredData_PS").assertValue strElementNumber1,"2"
							.webTable("PreferredData_PS").assertValue strRegionName1,"4"
							.webTable("PreferredData_PS").assertValue strTimeRange1,"1"
							.webTable("PreferredData_PS").assertValue strCampaignName1,"3"
							
							

End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RS_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultiplsSelectionsForSerachField", "REP_RSR_TC_031"