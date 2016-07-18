'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_ValidateTimeRange
' Description					:	Validate the Regions list box available on the "Campaign Summary" report.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateTimeRange", "REP_CSR_TC_007"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_VODADDELIVERYDATAFEED
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
							 wait Wait5

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
							
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,"All","False"
							
							.assertListItems MULTI_LIST_TIMERANGE_VOD &";"&DataSet,""
							wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"True"
							 wait Wait3
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange1,"True"
							 wait Wait3
							
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"True"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange1,"True"
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"True"
                            .validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"True"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange1,"True"							'''all items selected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							strTimeRange=testcasedata.getvalue("strTimeRange")
							strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"False"					'''all items deselected function
							wait Wait3
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"False"
							wait Wait3
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange1,"False"
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							strTimeRange=testcasedata.getvalue("strTimeRange")
							
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_TIMERANGE_VOD,strTimeRangeAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateTimeRange", "REP_CSR_TC_007"