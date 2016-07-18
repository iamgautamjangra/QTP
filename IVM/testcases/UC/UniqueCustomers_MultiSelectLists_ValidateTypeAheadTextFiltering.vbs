'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Type ahead search for multiselect list.
' Author 						:   Fonantrix Solution
' Date 							: 05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_UCR_TC_017"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait5

DataSet=DATASET_UNIQUECUSTOMERS

with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
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
							
							.webEdit("TimeRange").assertExist "True"
							.webEdit("TimeRange").assertStatus "Visible"
							.webEdit("TimeRange").assertValue "Type to search..."
							.webEdit("TimeRange").setValue strTimeRange																									
							.assertListSearch MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1
							 wait Wait2
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							 wait Wait5
							 strTimeRange1=testcasedata.getvalue("strTimeRange1")
							.webEdit("TimeRange").assertValue strTimeRange1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
							 wait Wait5
							'.webEdit("TimeRange").assertValue "Type to search..."
							 
							
End With

'End Test Case					
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_UCR_TC_017"			
