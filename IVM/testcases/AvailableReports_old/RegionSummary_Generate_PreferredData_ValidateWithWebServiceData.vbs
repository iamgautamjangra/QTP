'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RegionSummary_Generate_PreferredData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Preferred data tab with web service.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_RSR_TC_035"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

ivm.Activatebowser()
wait 2
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait20
DataSet=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
						wait 5
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"

						wait Wait5
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

REM 'Market Details table exist					
with ivm.page(preferredData_page)
							.webLink("PreferredData").press
							 wait Wait5

							'.webTable("PreferredData_RS").assertExist "True"
							.webTable("PreferredData_Header_RS").assertExist "True"
							.webTable("PreferredData_Header_RS").assertTableData reportRegionSummaryPreferred,DataSet
						
					
					''''''validate data with DGW
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_RSR_TC_035"