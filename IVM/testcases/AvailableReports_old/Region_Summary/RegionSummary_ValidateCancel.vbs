'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_ValidateCancel
' Description					:	Validate the Cancel operation on generate options page .
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_ValidateCancel", "REP_RSR_TC_017"

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10


DataSet=testcasedata.getvalue("DataSet")
ProviderID_val=testcasedata.getvalue("ProviderID_val")
strTimeRange=testcasedata.getvalue("strTimeRange")
Campaign_val=testcasedata.getvalue("Campaign_val")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Cancel").press
						wait 5
		
						.webTable("AvailableReports").assertExist "True"
						
						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
						.webButton("Cancel").press
						
						wait 5
						.webTable("AvailableReports").assertExist "True"
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_ValidateCancel", "REP_RSR_TC_017"