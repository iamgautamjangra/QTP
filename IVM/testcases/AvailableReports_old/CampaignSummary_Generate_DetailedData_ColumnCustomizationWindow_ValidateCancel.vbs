'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel
' Description					:	Validate cancel operation for "Customize Columns" pop up. 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"

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
strSearchTerm=testcasedata.getvalue("strSearchTerm")
strSearchTerm1=testcasedata.getvalue("strSearchTerm1")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportCampaignSummary,3
							 wait Wait5
							 
							 
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait5
						
						
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
							
							wait Wait5
							
							'.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							'.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
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
							
							.webTable("DetailedData_CS_Header").assertExist "True"
							.webTable("DetailedData_CS_Header").pressColumnCustomization 
							wait Wait3
																										
					        .selectCustomizeColumn strColumn,"False"
							.selectCustomizeColumn strColumn1,"False"
							

							.webLink("CustomizeCancel").press
							wait Wait10
							
							.webTable("DetailedData_RD").assertExist "True"
'Displayed columns							
							strColumn=testcasedata.getvalue("strColumn")
							strColumn1=testcasedata.getvalue("strColumn1")
							.webTable("DetailedData_CS_Header").assertCustomizeColumnExist strColumn,"True"
							.webTable("DetailedData_CS_Header").assertCustomizeColumnExist strColumn1,"True"
							

						
End with



'End Test Case 
 executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_ColumnCustomizationWindow_ValidateCancel", "REP_CSR_TC_046"