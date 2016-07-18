'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel
' Description					:	Validate cancel operation for "Customize Columns" pop up. 
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")



ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RD").assertExist "True"
							.webTable("DetailedData_RD_Header").pressColumnCustomization 
							wait 3
							
'for Displayed columns																					
					        .selectCustomizeColumn strColumn,"False"
							.selectCustomizeColumn strColumn1,"False"
							

							.webLink("CustomizeCancel").press
							wait 10
							
							.webTable("DetailedData_RD").assertExist "True"
'Displayed columns							
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist strColumn1,"True"
																							
							
					       			
End with



'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"