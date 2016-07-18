'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RDR_TC_025"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPid=testcasedata.getvalue("strProgramPid")
strProgramPid1=testcasedata.getvalue("strProgramPid1")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strClockNumber=testcasedata.getvalue("strClockNumber")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strDeviceId=testcasedata.getvalue("strDeviceId")
strDeviceId1=testcasedata.getvalue("strDeviceId1")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")
strBetweenDate1=testcasedata.getvalue("strBetweenDate1")
strAndDate1=testcasedata.getvalue("strAndDate1")

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

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait Wait4
							
							.webTable("PreferredData_RD").assertExist "True"
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
					        .webEdit("DeviceId_Adv").setValue strDeviceId
							
							.webEdit("ElementNumber_Adv").setValue strElementNumber
							
							.selectListItem MULTI_LIST_PROGRAMPID_ADV,strProgramPid,"True"
							wait Wait2
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.webEdit("Channel_Adv").setValue strChannel				      					 
							
					        .webLink("AdvCancel").press
						
						wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("DeviceId_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("Channel_Filter").assertExist "False"
							
						
End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateCancel", "REP_RDR_TC_025"