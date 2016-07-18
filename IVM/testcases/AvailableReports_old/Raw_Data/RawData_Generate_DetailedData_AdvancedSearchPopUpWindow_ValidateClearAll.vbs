'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"

DataSet=testcasedata.getvalue("DataSet")
'strCampaign=testcasedata.getvalue("strCampaign")
'strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strBindGUID=testcasedata.getvalue("strBindGUID")
strDeviceId=testcasedata.getvalue("strDeviceId")
strAdPID=testcasedata.getvalue("strAdPID")
strAdTitle=testcasedata.getvalue("strAdTitle")
strRegionName=testcasedata.getvalue("strRegionName")
strElementNumber=testcasedata.getvalue("strElementNumber")
strCampaignName=testcasedata.getvalue("strCampaignName")
strClockNumber=testcasedata.getvalue("strClockNumber")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPAID=testcasedata.getvalue("strProgramPAID")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")



ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							'.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							'.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
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
							
						   .webLink("AdvancedSearch").press
							wait 5
							.webEdit("BindGUID_Adv").setValue strBindGUID
							.webEdit("DeviceId_Adv").setValue strDeviceId
							.webEdit("AdPID_Adv").setValue strAdPID
							.webEdit("AdTitle_Adv").setValue strAdTitle
							.webEdit("RegionName_Adv").setValue strRegionName
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							
							'.webEdit("ProgramPAID_Adv").setValue strProgramPAID
							.webEdit("ProgramTitle_Adv").setValue strProgramTitle
						    wait 2
							.selectDate "BetweenDate",strBetweenDate
							wait 2
							.selectDate "AndDate",strAndDate
							wait 2
							
							.webLink("AdvClearAll").press							  
							  wait 2
							  
							 .webEdit("BindGUID_Adv").assertvalue ""
							 
							 
							 .webEdit("DeviceId_Adv").assertvalue ""
							
							 
							 .webEdit("AdPID_Adv").assertvalue ""
							 
							 
							 .webEdit("AdTitle_Adv").assertvalue ""
							
							 
							 .webEdit("RegionName_Adv").assertvalue ""
							 
							
							.webEdit("ElementNumber_Adv").assertvalue ""
							 wait 3
							strCampaignName=testcasedata.getvalue("strCampaignName")
							.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"False"
							
				            .webEdit("ClockNumber_Adv").assertValue ""
							 wait 3
							 strProgramPID=testcasedata.getvalue("strProgramPID")
							.validateSelectedListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"False"
							 wait 3
							 
							.webEdit("ProgramPAID_Adv").assertValue ""
							 wait 3
							 .webEdit("ProgramTitle_Adv").assertValue ""
							 wait 3
							 
							.webEdit("Between").assertValue "yyyy-mm-dd"
							wait 3
							.webEdit("And").assertValue "yyyy-mm-dd"
							wait 3
							
							.webLink("AdvCancel").press
						
						
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"