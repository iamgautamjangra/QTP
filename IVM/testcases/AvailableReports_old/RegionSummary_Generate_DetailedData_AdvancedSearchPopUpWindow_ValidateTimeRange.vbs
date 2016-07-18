'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange 
' Description					:	Validate the Time range filter using advanced search
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_RSR_TC_046"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
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
						
						 
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait Wait5
End with 


With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webElement("TimeRange_Adv").assertExist "True"
							.webElement("TimeRange_Adv").assertStatus "Visible"
							.webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,"All","False"
							
							REM .assertListItems MULTI_LIST_TIMERANGE_RS & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True" '''all items selected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False" '''all items deselected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							strTimeRange=testcasedata.getvalue("strTimeRange")
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait Wait4
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False"
							
							wait Wait2
							
							.webLink("AdvClearAll").press
							wait Wait2	
							
							strTimeRange=testcasedata.getvalue("strTimeRange")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							wait Wait2
							
							.webLink("AdvSearch").press
							wait Wait5
							
							.webElement("TimeRange_Filter").assertExist "True"
							If len(strTimeRange)>9 then 
							.webElement("TimeRange_Filter").assertText  "Time Range ="& mid(strTimeRange,1,8) &".." &"   X"
							
							Else
							.webElement("TimeRange_Filter").assertText  "Time Range ="& strTimeRange &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
							
						
							.webTable("DetailedData_RS").assertValue strTimeRange,"1"
							wait Wait5	
							.webTable("DetailedData_RS").assertDelValue strTimeRange1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("TimeRange_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RS").assertValue strTimeRange,"1"
							REM .webTable("DetailedData_RS").assertValue strTimeRange1,"1"
							
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_RSR_TC_046"