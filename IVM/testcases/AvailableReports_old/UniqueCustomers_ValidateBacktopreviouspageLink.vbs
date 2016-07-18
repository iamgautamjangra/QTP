'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	UniqueCustomers_ValidateBacktopreviouspageLink
' Description					:	Validate the "Back to Previous Page" link in "UniqueCustomers" page.
' Author 						:   SeaChange
' Date 							: 05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_ValidateBacktopreviouspageLink", "REP_UCR_TC_013"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")

DataSet=DATASET_UNIQUECUSTOMERS

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
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
						
						.weblink("FiltersAndComments").assertExist "True"							
						.weblink("FiltersAndComments").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").assertExist "True"
						.weblink("BackToPreviousPage").assertStatus "Visible"
						.weblink("BackToPreviousPage").press
						 wait Wait7	
End With

With ivm.page(report_page)
							
						.webElement("SelectaDatasetforThisReport").assertExist "True"							
						.webElement("SelectaDatasetforThisReport").assertStatus "Visible"
							
						.weblink("BackToPreviousPage").press
						wait Wait5
							
						.webTable("AvailableReports").assertExist "True"
End with
		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_ValidateBacktopreviouspageLink", "REP_UCR_TC_013"