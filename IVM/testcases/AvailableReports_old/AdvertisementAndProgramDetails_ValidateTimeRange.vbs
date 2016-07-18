'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetails_ValidateTimeRange
' Description					:	Validate the time range list box .
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetails_ValidateTimeRange", "REP_CSR_TC_007"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADPROGRAMDETAILS
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
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
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							wait 1
							.webLink("AdvSearch").press
							wait Wait3
							End If
							.webTable("DataSet").presstblRadioBtn DataSet,1
							wait Wait10

							.webEdit("TimeRange_APD").assertExist "True"
							.webEdit("TimeRange_APD").assertStatus "Visible"

							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,"All","False"

							.assertListItems MULTI_LIST_TIMERANGE_APD &";"&DataSet,""
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							wait Wait2
                            .validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"							'''all items selected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False"
							 wait Wait5
							wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False" '''all items deselected function
							wait Wait2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							strTimeRange=testcasedata.getvalue("strTimeRange")
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetails_ValidateTimeRange", "REP_CSR_TC_007"