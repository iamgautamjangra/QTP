'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_CSR_TC_042"

DataSet=testcasedata.getvalue("DataSet")
'strCampaign=testcasedata.getvalue("strCampaign")
'strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strBindGUID=testcasedata.getvalue("strBindGUID")
strBindGUID1=testcasedata.getvalue("strBindGUID1")
strDeviceId=testcasedata.getvalue("strDeviceId")
strDeviceId1=testcasedata.getvalue("strDeviceId1")
strAdPID=testcasedata.getvalue("strAdPID")
strAdPID1=testcasedata.getvalue("strAdPID1")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strRegionName=testcasedata.getvalue("strRegionName")
strRegionName1=testcasedata.getvalue("strRegionName1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strProgramPAID=testcasedata.getvalue("strProgramPAID")
strProgramPAID1=testcasedata.getvalue("strProgramPAID1")



REM ivm.ClickToMenu MENU_AVAILABLE_REPORTS
REM wait 10

REM With ivm.page(report_page)

							REM .webTable("AvailableReports").presstblLink reportRawData,3
							 REM wait 5

							REM .webTable("DataSet").presstblRadioBtn DataSet,1
							
							REM wait 5
							
							REM '.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							REM '.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							REM .webEdit("EmailRecipients").setValue strEmail
							
							REM .webEdit("StorageLocation").setValue strStorageLocation
							
							REM .webList("ReportFormat").selectItem strReportFormat
							
							REM .webList("DataType").selectItem strDataType
							
							REM .webEdit("Comments").setValue strComments
							
						
						REM .webButton("Generate").press
						REM wait 8

REM End with	

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
							.webLink("AdvCancel").press
							wait 5

							.webElement("BindGUID_Filter").assertExist "False"
							.webElement("DeviceId_Filter").assertExist "False"
							.webElement("AdPID_Filter").assertExist "False"
							.webElement("AdTitle_Filter").assertExist "False"
							.webElement("RegionName_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("CampaignName_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("ProgramPAID_Filter").assertExist "False"
							.webElement("ProgramTitle_Filter").assertExist "False"							
							
							.webTable("DetailedData_RD").assertValue strBindGUID1,"1"
							.webTable("DetailedData_RD").assertValue strDeviceId1,"3"
							.webTable("DetailedData_RD").assertValue strAdPID1,"16"
							.webTable("DetailedData_RD").assertValue strAdTitle1,"18"
							.webTable("DetailedData_RD").assertValue strRegionName1,"22"
							.webTable("DetailedData_RD").assertValue strElementNumber1,"27"
							.webTable("DetailedData_RD").assertValue strCampaignName1,"28"
							.webTable("DetailedData_RD").assertValue strClockNumber1,"29"
							.webTable("DetailedData_RD").assertValue strProgramPID1,"33"
							.webTable("DetailedData_RD").assertValue strProgramPAID1,"34"
							.webTable("DetailedData_RD").assertValue strProgramTitle1,"36"
							
							.webTable("DetailedData_RD").assertValue strBindGUID,"1"
							.webTable("DetailedData_RD").assertValue strDeviceId,"3"
							.webTable("DetailedData_RD").assertValue strAdPID,"16"
							.webTable("DetailedData_RD").assertValue strAdTitle,"18"
							.webTable("DetailedData_RD").assertValue strRegionName,"22"
							.webTable("DetailedData_RD").assertValue strElementNumber,"27"
							.webTable("DetailedData_RD").assertValue strCampaignName,"28"
							.webTable("DetailedData_RD").assertValue strClockNumber,"29"
							.webTable("DetailedData_RD").assertValue strProgramPID,"33"
							.webTable("DetailedData_RD").assertValue strProgramPAID,"34"
							.webTable("DetailedData_RD").assertValue strProgramTitle,"36"
							
							
							
End With	        		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_CSR_TC_042"