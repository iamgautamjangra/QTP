'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateDeviceID
' Description					:	Validate the element number filter on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateDeviceID", "REP_RDR_TC_018"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strDeviceId=testcasedata.getvalue("strDeviceId")
strDeviceId1=testcasedata.getvalue("strDeviceId1")
strDeviceIdInv=testcasedata.getvalue("strDeviceIdInv")


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
							
						   .webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DeviceId_Adv").setValue strDeviceId
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
														
							.webElement("DeviceId_Filter").assertExist "True"
							If len(strDeviceId)>9 then 
							.webElement("DeviceId_Filter").assertText  "Device ID ="& mid(strDeviceId,1,8) &".." &"   X"
							
							Else
							.webElement("DeviceId_Filter").assertText  "Device ID ="& strDeviceId &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							.webElement("DeviceId_Filter").assertExist "True"
							.webLink("ClearAll").press
							wait Wait5
							.webElement("DeviceId_Filter").assertExist "False"
							
														
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("DeviceId_Adv").setValue strDeviceIdInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
													
							.webElement("DeviceId_Filter").assertExist "True"
							If len(strDeviceIdInv)>9 then 
							.webElement("DeviceId_Filter").assertText  "Device ID ="& mid(strDeviceIdInv,1,10) &".." &"   X"
							
							Else
							.webElement("DeviceId_Filter").assertText  "Device ID ="& strDeviceIdInv &"   X"
							End If
							
							.webElement("DeviceId_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
						
							.webTable("PreferredData_RD").searchData NoRecordFound_msg
							.webElement("DeviceId_Filter").assertExist "True"
												
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("DeviceId_Filter").assertExist "False"
							
														
					        
							
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateDeviceID", "REP_RDR_TC_018"