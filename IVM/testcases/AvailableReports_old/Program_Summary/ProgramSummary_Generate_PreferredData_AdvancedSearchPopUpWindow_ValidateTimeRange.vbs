'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange 
' Description					:	Validate the time range filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_028"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7
 
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							wait 5
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webElement("TimeRange_Adv").assertExist "True"
							.webElement("TimeRange_Adv").assertStatus "Visible"
							.webEdit("TimeRange_Adv").assertExist "True"
							.webEdit("TimeRange_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,"All","False"
							
							.assertListItems MULTI_LIST_TIMERANGE_PS & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							 wait 2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait 2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True" '''all items selected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False" '''all items deselected function
							
							strTimeRangeAll=testcasedata.getvalue("strTimeRangeAll")
							strTimeRange=testcasedata.getvalue("strTimeRange")
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"True"
							 wait 4
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRangeAll,"False"
							
							wait 2
							
							.webLink("AdvClearAll").press
							wait 2	
							
							strTimeRange=testcasedata.getvalue("strTimeRange")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							wait 2
							
							.webLink("AdvSearch").press
							wait 5
							
							.webElement("TimeRange_Filter").assertExist "True"
							If len(strTimeRange)>9 then 
							.webElement("TimeRange_Filter").assertText  "Time Range ="& mid(strTimeRange,1,10) &".." &"   X"
							
							Else
							.webElement("TimeRange_Filter").assertText  "Time Range ="& strTimeRange &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_PS").assertExist "True"
							
						
							.webTable("PreferredData_PS").assertValue strTimeRange,"1"
							wait 5	
							.webTable("PreferredData_PS").assertDelValue strTimeRange1
							.webLink("ClearAll").press
							wait 5
							.webElement("TimeRange_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("PreferredData_PS").assertValue strTimeRange,"1"
							.webTable("PreferredData_PS").assertValue strTimeRange1,"1"
							
End with						  
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_CSR_TC_028"