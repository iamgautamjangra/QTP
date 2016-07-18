' (c) Copyright SeaChange
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateWithWebServiceData 
' Description					:   Validate "Channel 4 Data" table with API.
' Author 						:   SeaChange
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateWithWebServiceData ", "REP_VOD_TC_036"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

DataSet=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait20
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
						 
						
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8

End with
				
with ivm.page(PreferredData_page)

							 
							.assertExistLNK strProvider,"True","Press"
					
							 wait Wait5
							.webTable("ProviderData").assertTableData  reportVODAdDeliveryDataFeed,DataSet
			
End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_ValidateWithWebServiceData", "REP_VOD_TC_036"
