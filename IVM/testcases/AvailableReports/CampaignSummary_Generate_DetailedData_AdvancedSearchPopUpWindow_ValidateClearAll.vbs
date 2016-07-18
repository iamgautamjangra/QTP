'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"

'DataSet=testcasedata.getvalue("DataSet")

'strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
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
						wait Wait7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							.webEdit("ProgramPID_Adv").setValue strProgramPID
							REM .webEdit("ClockNumber_Adv").setValue strClockNumber
							strTimeRange=testcasedata.getvalue("strTimeRange")
							.selectListItem MULTI_LIST_TIMERANGE_AVAI2,strTimeRange,"True"
							wait wait5
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_Detail,strCampaignName,"True"
						   	wait wait5		        
							
							.webLink("AdvClearAll").press
							
							wait Wait2
							
							.webEdit("ElementNumber_Adv").assertValue ""
							REM .webEdit("ClockNumber_Adv").assertValue ""
							
							REM .validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
						
							.webEdit("CampaignName_Adv").assertValue "Type to search..."
							
							.webEdit("ProgramPID_Adv").assertValue "Type to search..."
						
							.webEdit("TimeRange_Adv").assertValue "Type to search..."
					
							.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI2,strTimeRange,"False"
							
										
							.webLink("AdvCancel").press
							
							
						
End With
				  
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"