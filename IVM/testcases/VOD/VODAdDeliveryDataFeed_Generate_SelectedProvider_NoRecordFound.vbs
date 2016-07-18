' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFound 
' Description					:   Validate the "Channel 4 Data" table when no record is found matching the filter criteria.
' Author 						:   Fonantrix Solution
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFound ", "REP_VOD_TC_035"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if



strTimeRange=testcasedata.getvalue("strTimeRange")

strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

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
						
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait3
						
						
						.webButton("Generate").press
						wait Wait8
End with 


With ivm.page(PreferredData_page)


							.assertExistLNK strProvider,"True","Press"
							wait Wait7
							.webTable("ProviderData").assertValue NoRecordFound_msg,1
						    .webLink("BackToPreviousPage").press
							wait Wait10		
							
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait Wait10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
						
End With
			

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_Generate_SelectedProvider_NoRecordFound", "REP_VOD_TC_035"
