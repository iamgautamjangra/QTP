'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_ValidateWithWebServiceData
' Description					:	Validate the data with webservices for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_CSR_TC_028"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5	
						.webLink("AdvancedSearch").press
	      				 wait Wait5
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						 wait Wait7
						 
						 
						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status="False" Then
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
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait5
							.webList("RowCount").selectItem "Show 40 rows"
						
							wait Wait5
				
							.webTable("PreferredData_CS").assertTabledata reportCampaignSummaryPreferred,DataSet

End with		
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_CSR_TC_028"