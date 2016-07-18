'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_CSR_TC_042"

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
							
						   .webLink("AdvancedSearch").press
							wait Wait5
							.webEdit("BindGUID_Adv").setValue strBindGUID
							.webEdit("DeviceId_Adv").setValue strDeviceId
							.webEdit("AdPID_Adv").setValue strAdPID
							.webEdit("AdTitle_Adv").setValue strAdTitle
							.webEdit("RegionName_Adv").setValue strRegionName
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
							
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV1,strProgramPID,"True"
							
							.webEdit("ProgramPAID_Adv").setValue strProgramPAID
							.webEdit("ProgramTitle_RD_Adv").setValue strProgramTitle
						    wait Wait2
							.webLink("AdvCancel").press
							wait Wait5

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
							
						
End With	        		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_CSR_TC_042"