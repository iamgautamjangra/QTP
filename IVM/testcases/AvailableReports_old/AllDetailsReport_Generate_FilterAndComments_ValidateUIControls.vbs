'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_FilterAndComments_ValidateUIControls
' Description					:   Validate UI of "AllDetails" report in Filters And Comments tab with different options.
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_FilterAndComments_ValidateUIControls", "REP_ADR_TC_019"
   
'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPID=testcasedata.getvalue("strProgramPID")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						 
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
						.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"

						wait Wait2
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

							.webLink("BackToPreviousPage").assertStatus "Visible"
							.webLink("BackToPreviousPage").assertExist "True"
							
							.webElement("AllDetails").assertExist "True"
							.webElement("AllDetails").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"
                            
							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							
					
							.webLink("DetailedData").assertExist "True"
							.webLink("DetailedData").assertStatus "Visible"

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
						

							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							
					
							.webElement("Campaigns").assertExist "True"
							.webElement("Campaigns").assertStatus "Visible"
							 
							
							
							.webElement("ProgramPid").assertExist "True"
							.webElement("ProgramPid").assertStatus "Visible"
							 
							
							
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							
							.webElement("Comments_val").assertText strComments
							
							
							 
					        .webLink("BackToPreviousPage").press
			                 wait Wait7
End with

with ivm.page(report_page)
							.webLink("AdvancedSearch").press
							wait Wait3
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
							
							.webButton("Generate").press
					        wait Wait5
End With

With ivm.page(preferredData_page)							

							.webElement("TimeRange").assertExist "False"
							.webElement("Campaigns").assertExist "False"
							
							.webElement("Comments").assertExist "False"
							
End With		
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_FilterAndComments_ValidateUIControls", "REP_ADR_TC_019"