'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName
' Description					:	Validate the Region Group Name filter on advanced search window
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName", "REP_RSR_TC_045"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strRegionGroupName=testcasedata.getvalue("strRegionGroupName")
strRegionGroupName1=testcasedata.getvalue("strRegionGroupName1")
strRegionGroupNameInv=testcasedata.getvalue("strRegionGroupNameInv")

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
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
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
							
							.webEdit("RegionGroupName_Adv").setValue strRegionGroupName
						   
							.webLink("AdvSearch").press
							.webElement("RegionGroupName_Filter").assertExist "True"
							If len(strRegionGroupName)>9 then 
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& mid(strRegionGroupName,1,8) &".." &"   X"
							
							Else
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& strRegionGroupName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
							
						
							.webTable("DetailedData_RS").assertValue strRegionGroupName,"7"
							wait Wait5	
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("RegionGroupName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							REM .webTable("DetailedData_RS").assertValue strRegionGroupName1,"7"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("RegionGroupName_Adv").setValue strRegionGroupNameInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("RegionGroupName_Filter").assertExist "True"
							If len(strRegionGroupNameInv)>9 then 
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& mid(strRegionGroupNameInv,1,8) &".." &"   X"
							
							Else
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& strRegionGroupNameInv &"   X"
							End If
							
							.webElement("RegionGroupName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
						
							.webTable("DetailedData_RS").searchData NoRecordFound_msg
							
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("RegionGroupName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_RS").assertValue strRegionGroupName,"7"
							
							REM .webTable("DetailedData_RS").assertValue strRegionGroupName1,"7"
							
							.webTable("DetailedData_RS").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName", "REP_RSR_TC_045"