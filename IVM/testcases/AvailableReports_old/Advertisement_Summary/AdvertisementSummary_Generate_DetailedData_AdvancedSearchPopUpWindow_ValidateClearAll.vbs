'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_ASR_TC_051"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
strAdTitle=testcasedata.getvalue("strAdTitle")
strClockNumber=testcasedata.getvalue("strClockNumber")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

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
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							.webEdit("AdTitle_Adv").setValue strAdTitle
							
													   
							
							.webLink("AdvClearAll").press							  
							  wait 2
							
							.webEdit("ElementNumber_Adv").assertvalue ""
							 
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
							 
							 .webEdit("CampaignName_Adv").assertValue "Type to search..."
							
							 
				            .webEdit("ClockNumber_Adv").assertValue ""
							 
							 .validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"False"
							 .webEdit("ProgramPID_Adv").assertValue "Type to search..."
							 
							 .validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"False"
							.webEdit("TimeRange_Adv").assertValue "Type to search..."
							
							.webEdit("AdTitle_Adv").assertValue ""
											
							
End with

			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_ASR_TC_051"