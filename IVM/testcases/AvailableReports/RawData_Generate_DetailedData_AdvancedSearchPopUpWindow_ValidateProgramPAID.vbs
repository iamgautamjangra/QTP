'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPAID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPAID", "REP_RDR_TC_037"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramPAID=testcasedata.getvalue("strProgramPAID")
strProgramPAID1=testcasedata.getvalue("strProgramPAID1")
strProgramPAIDInv=testcasedata.getvalue("strProgramPAIDInv")


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
							
							.webEdit("ProgramPAID_Adv").setValue strProgramPAID
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
						
							
							.webElement("ProgramPAID_Filter").assertExist "True"
							If len(strProgramPAID)>9 then 
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& mid(strProgramPAID,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& strProgramPAID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPAID_Filter").assertExist "False"
							
													
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramPAID_Adv").setValue strProgramPAIDInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
												
							.webElement("ProgramPAID_Filter").assertExist "True"
							If len(strProgramPAIDInv)>9 then 
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& mid(strProgramPAIDInv,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPAID_Filter").assertText  "Program PAID ="& strProgramPAIDInv &"   X"
							End If
							
							.webElement("ProgramPAID_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
														
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ProgramPAID_Filter").assertExist "False"
							
														
					        
							
End with	
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramPAID", "REP_RDR_TC_037"