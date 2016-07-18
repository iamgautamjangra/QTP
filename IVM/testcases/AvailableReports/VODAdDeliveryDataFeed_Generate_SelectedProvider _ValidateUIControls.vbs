'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider _ValidateUIControls
' Description					:   Validate UI controls of "Channel 5 Data" Tab..
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider _ValidateUIControls", "REP_VOD_TC_041"
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
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					  
					   .webList("Provider").selectItem strProvider
						 wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8

End with
				
with ivm.page(PreferredData_page)

							 
							.assertExistLNK strProvider,"True","Press"
							
							 wait Wait5
							 
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webLink("Actions").press							
							 wait Wait3

						                     
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"
							
							.webLink("ExportToPDF").assertExist "False"
							 
						
							.webTable("ProviderData").assertExist "True"
							
							
							.webTable("ProviderData_Header").assertExist "True"
							
							
							.webTable("ProviderData_Header").assertColumnExist "Date", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Provider", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Content Reference", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Region", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Campaign Reference", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Campaign Name", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Position", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Impressions", "True"
							
							.webTable("ProviderData_Header").assertColumnExist "Actions", "True"
							


End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider _ValidateUIControls", "REP_VOD_TC_041"