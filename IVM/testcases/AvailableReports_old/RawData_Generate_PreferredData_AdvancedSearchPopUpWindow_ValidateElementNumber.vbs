'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber
' Description					:	Validate the element number filter on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RDR_TC_018"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strElementNumberInv=testcasedata.getvalue("strElementNumberInv")

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
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
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
							
							.webEdit("ElementNumber_Adv").setValue strElementNumber
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ElementNumber_Filter").assertExist "False"
							
												
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ElementNumber_Adv").setValue strElementNumberInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
														
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumberInv)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumberInv,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumberInv &"   X"
							End If
							
							.webElement("ElementNumber_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
						
							.webTable("PreferredData_RD").searchData NoRecordFound_msg
							
							.webElement("ElementNumber_Filter").assertExist "True"
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ElementNumber_Filter").assertExist "False"
							
							
							
					        
							
End with						
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RDR_TC_018"