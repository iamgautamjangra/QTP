'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_BacktopreviouspageLink
' Description					:	Validate the "Back to Previous Page" link in "VOD Ad Delivery Data Feed" page.
' Author 						:   SeaChange
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_BacktopreviouspageLink", "REP_VOD_TC_011"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

strSeachValue=testcasedata.getvalue("strSeachValue")
DataSet=DATASET_VODADDELIVERYDATAFEED

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait Wait10	
						 
						.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait10
							
							
							
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
												
						.webButton("Generate").press
						wait Wait5
End with 

With ivm.page(PreferredData_page)
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait Wait7
End With

With ivm.page(report_page)
							
						
						.webElement("SelectaDatasetforThisReport").assertExist "True"
						.webtable("DataSet_Header").assertExist "True"
							
						.weblink("BackToPreviousPage").press
						wait Wait5
							
						.webTable("AvailableReports").assertExist "True"
					
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_BacktopreviouspageLink", "REP_VOD_TC_011"