'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateChannel
' Description					:	Validate the Region Group Name filter on advanced search window
' Author 						:   SeaChange
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_ADR_TC_031"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strChannel=testcasedata.getvalue("strChannel")
strChannel1=testcasedata.getvalue("strChannel1")
strChannelInv=testcasedata.getvalue("strChannelInv")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait7
DataSet=DATASET_ALLDETAILS
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAllDetails,3
						 wait Wait10	
						   .webLink("AdvancedSearch").press
						    wait Wait3
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
							wait Wait7
						REM .selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						REM .selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						REM wait Wait2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with 
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							
							.webEdit("Channel_AD_Adv").setValue strChannel
						   
							.webLink("AdvSearch").press
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannel)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannel,1,8) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannel &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"

							.webLink("ClearAll").press
							wait Wait5
							.webElement("Channel_Filter").assertExist "False"
							
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("Channel_AD_Adv").setValue strChannelInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
							
							.webElement("Channel_Filter").assertExist "True"
							If len(strChannelInv)>9 then 
							.webElement("Channel_Filter").assertText  "Channel ="& mid(strChannelInv,1,8) &".." &"   X"
							
							Else
							.webElement("Channel_Filter").assertText  "Channel ="& strChannelInv &"   X"
							End If
							
							.webElement("Channel_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"
						
							.webTable("DetailedData_AD").searchData NoRecordFound_msg
							
						
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("Channel_Filter").assertExist "False"
							
						
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateChannel", "REP_ADR_TC_031"