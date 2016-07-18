'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_FilterAndComments_ValidateUIControls
' Description					:	Validate the creation of "AdvertisementSummary" with valid data.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_012"
   
'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait Wait5

								.webLink("AdvancedSearch").press
								 wait Wait5
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
						wait Wait10
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with

'Market Details table exist					
with ivm.page(preferredData_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("RawData").assertExist "True"
							.webElement("RawData").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"

							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							
							.webLink("PreferredData").assertExist "True"
							.webLink("PreferredData").assertStatus "Visible"
							 
						    .webLink("DetailedData").assertExist "True"
							.webLink("DetailedData").assertStatus "Visible"

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
							 wait Wait3

						                     
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXLS").assertExist "False"
							.webLink("ExportToPDF").assertExist "False"
							
		                     
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("CampaignNames").assertExist "True"
							.webElement("CampaignNames").assertStatus "Visible"
							
							
							
							.webElement("ProgramPid").assertExist "True"
							.webElement("ProgramPid").assertStatus "Visible"
							
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_FilterAndComments_ValidateUIControls", "REP_CSR_TC_012"