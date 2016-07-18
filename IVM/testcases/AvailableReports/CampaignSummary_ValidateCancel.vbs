'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_ValidateCancel
' Description					:	Validate the Cancel operation on generate options page .
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_ValidateCancel", "REP_CSR_TC_017"




DataSet=DATASET_CAMPAIGNSUMMARY



'ProviderID_val=testcasedata.getvalue("ProviderID_val")
strTimeRange=testcasedata.getvalue("strTimeRange")
'Campaign_val=testcasedata.getvalue("Campaign_val")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strCampaign=testcasedata.getvalue("strCampaign")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait20
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
						 .webLink("AdvancedSearch").press
						wait Wait3
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
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Cancel").press
						wait Wait5
		
						.webTable("AvailableReports").assertExist "True"
						
						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait10	
						.webButton("Cancel").press
						
						wait Wait5
						.webTable("AvailableReports").assertExist "True"
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_ValidateCancel", "REP_CSR_TC_017"