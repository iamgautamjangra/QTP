'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID", "REP_RDR_TC_037"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdPID=testcasedata.getvalue("strAdPID")
strAdPID1=testcasedata.getvalue("strAdPID1")
strAdPIDInv=testcasedata.getvalue("strAdPIDInv")


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
							
							.webEdit("AdPID_Adv").setValue strAdPID
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
														
							.webElement("AdPID_Filter").assertExist "True"
							If len(strAdPID)>9 then 
							.webElement("AdPID_Filter").assertText  "Ad PID ="& mid(strAdPID,1,8) &".." &"   X"
							
							Else
							.webElement("AdPID_Filter").assertText  "Ad PID ="& strAdPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("AdPID_Filter").assertExist "False"
							
									
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("AdPID_Adv").setValue strAdPIDInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
												
							.webElement("AdPID_Filter").assertExist "True"
							If len(strAdPIDInv)>9 then 
							.webElement("AdPID_Filter").assertText  "Ad PID ="& mid(strAdPIDInv,1,10) &".." &"   X"
							
							Else
							.webElement("AdPID_Filter").assertText  "Ad PID ="& strAdPIDInv &"   X"
							End If
							
							.webElement("AdPID_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
											
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("AdPID_Filter").assertExist "False"
							
						       
							
End with								
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID", "REP_RDR_TC_037"