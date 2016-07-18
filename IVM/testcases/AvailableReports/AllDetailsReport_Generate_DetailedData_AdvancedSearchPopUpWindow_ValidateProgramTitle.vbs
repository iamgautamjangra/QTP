'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle
' Description					:	Validate the ProgramTitle filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   08-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_ADR_TC_032"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramTitle=testcasedata.getvalue("strProgramTitle")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strProgramTitleInv=testcasedata.getvalue("strProgramTitleInv")
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
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
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
							
							.webEdit("ProgramTitle_AD_Adv").setValue strProgramTitle
						   wait wait3
							.webLink("AdvSearch").press
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitle)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitle,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"
						
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramTitle_Filter").assertExist "False"
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramTitle_AD_Adv").setValue strProgramTitleInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
											
							.webElement("ProgramTitle_Filter").assertExist "True"
							If len(strProgramTitleInv)>9 then 
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& mid(strProgramTitleInv,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramTitle_Filter").assertText  "Program Title ="& strProgramTitleInv &"   X"
							End If
							
							.webElement("ProgramTitle_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_AD").assertExist "True"
						
							.webTable("DetailedData_AD").searchData NoRecordFound_msg
							
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ProgramTitle_Filter").assertExist "False"
							
						        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AllDetailsReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_ADR_TC_032"