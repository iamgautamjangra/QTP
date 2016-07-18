'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_ValidateWithWebServiceData
' Description					:	Validate the data displayed on the Preferred data tab with web service.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_ASR_TC_035"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strTimeRange=testcasedata.getvalue("strTimeRange")
strClockNumber=testcasedata.getvalue("strClockNumber")
strElementNumber=testcasedata.getvalue("strElementNumber")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 5
							'.webList("RowCount").selectItem "Show 40 rows"
							
							'wait 5
							.webTable("PreferredData_AS").assertTableData reportAdvertisementSummaryPreferred,DataSet
						
					
					''''''validate data with DGW
End with
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateWithWebServiceData", "REP_ASR_TC_035"