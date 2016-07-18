'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate Cancel operation on advanced search
' Author 						:   SeaChange
' Date 							:   04-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_ASR_TC_051"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
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
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")

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
							
													   
							.webLink("AdvCancel").press
							
							wait 2
							
						
							.webTable("DetailedData_AS").assertExist "True"
							
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							
						
							
							.webTable("DetailedData_AS").assertValue strProgramPID1,"5"
							.webTable("DetailedData_AS").assertValue strElementNumber1,"2"
							.webTable("DetailedData_AS").assertValue strTimeRange1,"1"
							.webTable("DetailedData_AS").assertValue strCampaignName1,"3"
							.webTable("DetailedData_AS").assertValue strClockNumber1,"4"
							.webTable("DetailedData_AS").assertValue strAdTitle1,"7"
							
							

End with
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_ASR_TC_051"