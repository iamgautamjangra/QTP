'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate the UI controls of "Filter and Comments" Tab.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls", "REP_VOD_TC_021"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strTimeRange=testcasedata.getvalue("strTimeRange")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_VODADDELIVERYDATAFEED
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
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
									
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait2
						
					     .webList("Provider").selectItem strProvider
						 wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8

End with

				
with ivm.page(PreferredData_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("VODAdDeliveryDataFeed").assertExist "True"
							.webElement("VODAdDeliveryDataFeed").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"

							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							 
						    

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
							 wait Wait3

						                     
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"
		                     
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.webElement("TimeRange_Selected").assertText strTimeRange
							
							
							.webElement("SelectedProviderIs").assertExist "True"
							.webElement("SelectedProviderIs").assertStatus "Visible"
							.webElement("Provider_Selected").assertText strProvider
							
							
							
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments
End with

executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_FilterAndComments_ValidateUIControls", "REP_VOD_TC_021"