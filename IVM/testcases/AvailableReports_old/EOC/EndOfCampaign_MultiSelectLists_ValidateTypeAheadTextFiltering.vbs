'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Type ahead search for multiselect list.
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_EOC_TC_019"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")



ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
							wait 10
							
							.webTable("DataSet").presstblRadioBtn DataSet,1 
							wait 5
							
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
						
							wait 5
						
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							.webEdit("TimeRange").assertValue "Type to search..."
							.webEdit("TimeRange").setValue strTimeRange																									
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							 wait 2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait 5
							 strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.webEdit("TimeRange").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait 5
							.webEdit("TimeRange").assertValue "Type to search..."
							 wait 3	
							
End with							

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_EOC_TC_019"			
