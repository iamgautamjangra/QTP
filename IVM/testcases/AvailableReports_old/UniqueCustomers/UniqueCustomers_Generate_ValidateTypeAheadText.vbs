'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_Generate_ValidateTypeAheadText
' Description					:	Validate the type ahead search  on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_Generate_ValidateTypeAheadText", "REP_ADR_TC_034"

DataSet=testcasedata.getvalue("DataSet")
strComments=testcasedata.getvalue("strComments")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10


With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"							 
							.webEdit("TimeRange").assertValue "Type to search..."																							
							.webEdit("TimeRange").setValue strTimeRange																								
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange
                            wait 5
							.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						
							
							.webEdit("TimeRange").assertValue strTimeRange1
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							
							.webEdit("TimeRange").assertValue "Type to search..."
						
						
End with 
	
							
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_Generate_ValidateTypeAheadText", "REP_ADR_TC_034"