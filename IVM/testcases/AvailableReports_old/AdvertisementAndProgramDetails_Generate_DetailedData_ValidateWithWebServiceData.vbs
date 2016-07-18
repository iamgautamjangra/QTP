'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Detailed data tab with web service.
' Author 						:   SeaChange
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateWithWebServiceData", "REP_APD_TC_045"



DataSet=testcasedata.getvalue("DataSet")
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
wait Wait5
DataSet=DATASET_ADPROGRAMDETAILS
          REM ' ivm.browserRefresh	
			REM wait 20
With ivm.page(report_page)
                          
						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3

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
						wait Wait5
						.webEdit("DatasetName").setValue DataSet
						wait 5
						.webLink("AdvSearch").press
						wait Wait5
						End If				
						.webTable("DataSet").presstblRadioBtn DataSet,1

						wait Wait5

						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"

						wait Wait5
						.webEdit("EmailRecipients").setValue strEmail

						.webEdit("StorageLocation").setValue strStorageLocation

						.webList("ReportFormat").selectItem strReportFormat

						.webList("DataType").selectItem strDataType

						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 

With ivm.page(detailedData_page)

						.webLink("DetailedData").press
						wait Wait7
						.webTable("DetailedData_APD").assertExist "True"
						.webTable("DetailedData_APD").assertTableData reportAdvertisementandProgramDetailsDetailed,DataSet
						
					
					''''''validate data with DGW
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateWithWebServiceData", "REP_APD_TC_045"