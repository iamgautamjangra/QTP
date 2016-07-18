'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel","REP_CSR_TC_042"

'DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strTimeRange=testcasedata.getvalue("strTimeRange")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait20
DataSet=DATASET_CAMPAIGNSUMMARY

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait20	
						 .webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait8
						
						
						
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
						'.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						'.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait5
End with 
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							.webEdit("ProgramPID_Adv").setValue strProgramPID
							
							.selectListItem MULTI_LIST_TIMERANGE_AVAI2,strTimeRange,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_Detail,strCampaignName,"True"
						   
							.webLink("AdvCancel").press
							
							wait Wait2
							
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							
							
							
							.webTable("DetailedData_CS").assertExist "True"
							
							
			

End with	
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel","REP_CSR_TC_042"