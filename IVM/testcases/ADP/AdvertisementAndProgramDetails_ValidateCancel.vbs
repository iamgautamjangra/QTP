'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Cancel
' Description					:	Validate the Cancel operation on generate options page .
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Cancel", "REP_APD_TC_020"

DataSet=testcasedata.getvalue("DataSet")
ProviderID_val=testcasedata.getvalue("ProviderID_val")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPID=testcasedata.getvalue("strProgramPID")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADPROGRAMDETAILS
With ivm.page(report_page)

								.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
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
								.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
								.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
								.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
								wait Wait2
								.webEdit("EmailRecipients").setValue strEmail

								.webEdit("StorageLocation").setValue strStorageLocation

								.webList("ReportFormat").selectItem strReportFormat

								.webList("DataType").selectItem strDataType

								.webEdit("Comments").setValue strComments
								.webButton("Cancel").press
								wait Wait5

								.webTable("AvailableReports").assertExist "True"

								.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
								wait Wait10	
								.webButton("Cancel").press

								wait Wait5
								.webTable("AvailableReports").assertExist "True"
End with						
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Cancel", "REP_APD_TC_020"