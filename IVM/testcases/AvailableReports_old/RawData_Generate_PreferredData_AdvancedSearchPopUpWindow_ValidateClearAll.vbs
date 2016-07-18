'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_026"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPid=testcasedata.getvalue("strProgramPid")
strChannel=testcasedata.getvalue("strChannel")
strElementNumber=testcasedata.getvalue("strElementNumber")
strClockNumber=testcasedata.getvalue("strClockNumber")
strDeviceId=testcasedata.getvalue("strDeviceId")
strBetweenDate=testcasedata.getvalue("strBetweenDate")
strAndDate=testcasedata.getvalue("strAndDate")

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
							
													
						.webLink("AdvClearAll").press
						wait Wait2
						
						.webEdit("DeviceId_Adv").assertValue ""
						
					
						.webEdit("ElementNumber_Adv").assertValue ""
						
						.webEdit("ProgramPID_Adv").assertValue "Type to search..."
						.webEdit("ClockNumber_Adv").assertValue ""
						
						.webEdit("Channel_Adv").assertValue ""
						
											
						.webLink("AdvCancel").press
						
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_026"