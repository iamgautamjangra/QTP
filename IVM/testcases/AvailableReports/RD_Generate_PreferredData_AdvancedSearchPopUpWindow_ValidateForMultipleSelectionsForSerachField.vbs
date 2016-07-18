'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RD_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachField
' Description					:	Validate the multipel search using advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RD_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachField", "REP_RDR_TC_024"

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
strBetweenDateInv=testcasedata.getvalue("strBetweenDateInv")

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
						
					     					 
							
					        .webLink("AdvSearch").press					
					         wait 15
							 
							 .webElement("DeviceId_Filter").assertExist "True"
							If len(strDeviceId)>9 then 
							.webElement("DeviceId_Filter").assertText  "Device ID ="& mid(strDeviceId,1,10) &".." &"   X"
							
							Else
							.webElement("DeviceId_Filter").assertText  "Device ID ="& strDeviceId &"   X"
							
							End If
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
							
							.webElement("ClockNumber_Filter").assertExist "True"
							If len(strClockNumber)>9 then 
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& mid(strClockNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ClockNumber_Filter").assertText  "Clock Number ="& strClockNumber &"   X"
							
							End If
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannel)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannel,1,10) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannel &"   X"
							
							End If
							 
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPid)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPid,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPid &"   X"
							
							End If
							
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							.webElement("ProgramPID_Filter").assertExist "True"
							.webElement("DeviceId_Filter").assertExist "True"
							.webElement("ElementNumber_Filter").assertExist "True"
							.webElement("ClockNumber_Filter").assertExist "True"
							.webElement("Channel_Filter").assertExist "True"

							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("DeviceId_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("ClockNumber_Filter").assertExist "False"
							.webElement("Channel_Filter").assertExist "False"

									
					        			
End with


executionController.stopTestCase_w_TestCaseNumber "RD_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSerachField", "REP_RDR_TC_024"