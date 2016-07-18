'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering
' Description					:	Validate the Type ahead search for multiselect list.
' Author 						:   SeaChange
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_EOC_TC_019"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")

DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
							wait Wait10
							
							.webLink("AdvancedSearch").press
								 wait Wait5
								.webEdit("DatasetName").setValue DataSet
								.webLink("AdvSearch").press
								 wait wait10
						
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
						wait Wait7
						

							
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
						
							wait Wait5
						
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
							 
							.webbutton("Cancel").press
							
							
End with							

'End Test Case				
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_MultiSelectLists_ValidateTypeAheadTextFiltering", "REP_EOC_TC_019"			
