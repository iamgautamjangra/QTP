'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle
' Description					:	Validate the ProgramSeriesTitle filter on advanced search window
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle", "REP_PSR_TC_047"

'DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strProgramSeriesTitle=testcasedata.getvalue("strProgramSeriesTitle")
strProgramSeriesTitle1=testcasedata.getvalue("strProgramSeriesTitle1")
strProgramSeriesTitleInv=testcasedata.getvalue("strProgramSeriesTitleInv")


if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_PROGRAMSUMMARY

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10	
						 
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
						wait Wait10
End with 
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							
							.webEdit("ProgramSeriesTitle_Adv").setValue strProgramSeriesTitle
						   
							.webLink("AdvSearch").press
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							If len(strProgramSeriesTitle)>9 then 
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& mid(strProgramSeriesTitle,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& strProgramSeriesTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_PS").assertExist "True"
							
						

							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramSeriesTitle_Filter").assertExist "False"
							
						
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramSeriesTitle_Adv").setValue strProgramSeriesTitleInv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
											
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							If len(strProgramSeriesTitleInv)>9 then 
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& mid(strProgramSeriesTitleInv,1,8) &".." &"   X"
							
							Else
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& strProgramSeriesTitleInv &"   X"
							End If
							
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_PS").assertExist "True"
						
							.webTable("DetailedData_PS").searchData NoRecordFound_msg
							
						
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ProgramSeriesTitle_Filter").assertExist "False"
							
					
					        
End with				
'End Test CaseexecutionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle", "REP_PSR_TC_047"