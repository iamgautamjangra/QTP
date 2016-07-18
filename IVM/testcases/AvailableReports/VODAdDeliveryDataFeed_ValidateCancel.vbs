'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_ValidateCancel
' Description					:	Validate the "VOD Ad Delivery Data Feed" on clicking "Cancel" button.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateCancel", "REP_VOD_TC_020"

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strEmail=testcasedata.getvalue("strEmail")
strReportFormat=testcasedata.getvalue("strReportFormat")
strStorageLocation=testcasedata.getvalue("strStorageLocation")


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
						.selectListItem MULTI_LIST_TIMERANGE_VOD,strTimeRange,"True"
						wait Wait2
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					    .webList("Provider").selectItem strProvider
						.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
						
							
							.webEdit("Comments").setValue strComments
							
							.webButton("Cancel").press
							wait Wait5
							
							.webElement("AvailableReports").assertExist "True"
							.webElement("AvailableReports").assertStatus "Visible"
							
							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
							 wait Wait5
							 
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
							
							wait Wait5
							
							.webButton("Cancel").press
							wait Wait5
							
							.webElement("AvailableReports").assertExist "True"
							.webElement("AvailableReports").assertStatus "Visible"
						
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ValidateCancel", "REP_VOD_TC_020"