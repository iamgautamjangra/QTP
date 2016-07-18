'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel
' Description					:	Validate the element number filter on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_RDR_TC_018"

'DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strChannelInv=testcasedata.getvalue("strChannelInv")


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
							
							.webEdit("Channel_Adv").setValue strChannel
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannel)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannel,1,10) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannel &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
							.webElement("Channel_Filter").assertExist "True"
							.webLink("ClearAll").press
							wait Wait5
							.webElement("Channel_Filter").assertExist "False"
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("Channel_Adv").setValue strChannelInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannelInv)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannelInv,1,10) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannelInv &"   X"
							End If
							
							.webElement("Channel_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RD").assertExist "True"
						
							.webTable("PreferredData_RD").searchData NoRecordFound_msg
							.webElement("Channel_Filter").assertExist "True"
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("Channel_Filter").assertExist "False"
							
							
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_RDR_TC_018"