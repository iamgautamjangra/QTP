'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply
' Description					:	Select columns and Apply and validate table columns are displayed as per customized column added. 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_RDR_TC_047"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strColumn=testcasedata.getvalue("strColumn")
strColumn1=testcasedata.getvalue("strColumn1")

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
						
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait Wait8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_RD").assertExist "True"
							.webTable("DetailedData_RD_Header").pressColumnCustomization 
							wait Wait3
							
'for Displayed columns																					
					        .selectCustomizeColumn "Bind GUID","False"
							.selectCustomizeColumn "Placement Asset Type","False"
							.selectCustomizeColumn "Placement View Type Unknown","False"	
							.selectCustomizeColumn "Placement View Type Full","False"
							.selectCustomizeColumn "Placement View Type Partial","False"
							.selectCustomizeColumn "Placement View Type Fast Forward","False"							
						    .selectCustomizeColumn "Placement Play Time","False"														
							.selectCustomizeColumn "Placement Fast Forwards","False"							
							.selectCustomizeColumn "Placement Rewinds","False"
							.selectCustomizeColumn "Placement Pauses","False"	
							.selectCustomizeColumn "Placement Not Viewed","False"
							.selectCustomizeColumn "Break Number","False"
							.selectCustomizeColumn "Slot Position","False"
						    .selectCustomizeColumn "Ad PID","False"														
							.selectCustomizeColumn "Ad PAID","False"														
							.selectCustomizeColumn "Ad Title","False"
							.selectCustomizeColumn "Ad Impression Limit","False"	
							.selectCustomizeColumn "Ad Duration","False"
							.selectCustomizeColumn "Region ID","False"
							.selectCustomizeColumn "Region Name","False"							
						    .selectCustomizeColumn "Region Group Name","False"														
							.selectCustomizeColumn "Campaign ID","False"														
							.selectCustomizeColumn "Campaign Start Date","False"
							.selectCustomizeColumn "Campaign End Date","False"	
							.selectCustomizeColumn "Campaign Name","False"
							.selectCustomizeColumn "Campaign Impression Limit","False"
							.selectCustomizeColumn "Client ID","False"
						    .selectCustomizeColumn "Client Name","False"														
							.selectCustomizeColumn "Prog PAID","False"	
							.selectCustomizeColumn "Program PID","False"							
							.selectCustomizeColumn "Prog Title","False"
							.selectCustomizeColumn "Prog Series Title","False"	
							.selectCustomizeColumn "Prog Episode Title","False"
							.selectCustomizeColumn "Campaign Impression Limit","False"
							.selectCustomizeColumn "Prog Genre","False"
						
																																																																	
							.webLink("CustomizeApply").press
							wait Wait10
							
							.webTable("DetailedData_RD").assertExist "True"
'Displayed columns							

							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Bind GUID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Asset Type","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement View Type Unknown","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement View Type Full","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement View Type Partial","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement View Type Fast Forward","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Play Time","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Fast Forwards","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Rewinds","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Pauses","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Placement Not Viewed","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Break Number","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Slot Position","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Ad PID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Ad PAID","False"							
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Ad Title","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Ad Impression Limit","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Ad Duration","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Region ID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Region Name","False"							
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Region Group Name","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign ID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign Start Date","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign End Date","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign Name","False"														
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign Impression Limit","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Client ID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Client Name","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Prog PAID","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Prog Title","False"							
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Prog Series Title","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Prog Episode Title","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Campaign Impression Limit","False"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist "Prog Genre","False"
							
							
							.webTable("DetailedData_RD_Header").pressColumnCustomization 
							 wait Wait3
							 .selectCustomizeColumn strColumn, "True"
							 .selectCustomizeColumn  strColumn1,"True"
							 
							.webLink("CustomizeApply").press
							wait Wait10
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_RD_Header").assertCustomizeColumnExist strColumn1,"True"
							 
							
End with

'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_ColumnCustomizationWindow_ValidateApply", "REP_RDR_TC_047"