'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate UI of "Campaign Summary" report in Filters And Comments tab with different options.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_019"
   


strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

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
						
						strTimeRange=testcasedata.getvalue("strTimeRange")
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						wait wait2
						
						strCampaign=testcasedata.getvalue("strCampaign")
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
						
						.webEdit("EmailRecipients").setValue strEmail
						.webEdit("StorageLocation").setValue strStorageLocation
						.webList("ReportFormat").selectItem strReportFormat
						.webList("DataType").selectItem strDataType
						.webEdit("Comments").setValue strComments
						wait wait2
						.webButton("Generate").press
						wait Wait10
End with 

REM 'Market Details table exist					
with ivm.page(preferredData_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("CampaignSummary").assertExist "True"
							.webElement("CampaignSummary").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"
                             wait Wait5
							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							
							.webLink("PreferredData").assertExist "True"
							.webLink("PreferredData").assertStatus "Visible"
							 wait Wait5
							.webLink("DetailedData").assertExist "True"
							.webLink("DetailedData").assertStatus "Visible"

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
							 wait Wait5

							.webLink("ExportToPDF").assertExist "True"
							.webLink("ExportToPDF").assertStatus "Visible"
		                      wait Wait5
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "True"
							.webLink("ExportToXLS").assertStatus "Visible"
		                      wait Wait5
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.assertExistWE strTimeRange,"True"
					
							REM .webElement("Campaigns").assertExist "True"
							REM .webElement("Campaigns").assertStatus "Visible"
							 
							REM .assertExistWE strCampaign,"True"
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							
							.webElement("Comments_val").assertText strComments
							
							
							 
					        .webLink("BackToPreviousPage").press
			                 wait Wait5
End with

with ivm.page(report_page)

						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait 2

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait Wait5
							
							.webButton("Generate").press
					        wait Wait5
End With

With ivm.page(preferredData_page)							
                             .webLink("PreferredData").press
							 wait Wait5
							REM .webElement("TimeRange").assertExist "False"
							REM .webElement("Campaigns").assertExist "False"
							REM .webElement("Comments").assertExist "False"
							
End With							 

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_019"