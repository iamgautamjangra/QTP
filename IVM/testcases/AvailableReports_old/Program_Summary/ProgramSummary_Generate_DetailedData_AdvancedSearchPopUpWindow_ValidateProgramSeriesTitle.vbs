'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle
' Description					:	Validate the ProgramSeriesTitle filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle", "REP_PSR_TC_047"

DataSet=testcasedata.getvalue("DataSet")
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

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("ProgramSeriesTitle_Adv").setValue strProgramSeriesTitle
						   
							.webLink("AdvSearch").press
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							If len(strProgramSeriesTitle)>9 then 
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& mid(strProgramSeriesTitle,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& strProgramSeriesTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_PS").assertExist "True"
							
						
							.webTable("DetailedData_PS").assertValue strProgramSeriesTitle,"9"
							wait 5	
							.webTable("DetailedData_PS").assertDelValue strProgramSeriesTitle1
							.webLink("ClearAll").press
							wait 5
							.webElement("ProgramSeriesTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_PS").assertValue strProgramSeriesTitle1,"9"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramSeriesTitle_Adv").setValue strProgramSeriesTitleInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							If len(strProgramSeriesTitleInv)>9 then 
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& mid(strProgramSeriesTitleInv,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramSeriesTitle_Filter").assertText  "Program Series Title ="& strProgramSeriesTitleInv &"   X"
							End If
							
							.webElement("ProgramSeriesTitle_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_PS").assertExist "True"
						
							.webTable("DetailedData_PS").searchData NoRecordFound_msg
							
							.webTable("DetailedData_PS").assertDelValue strProgramSeriesTitle
							.webTable("DetailedData_PS").assertDelValue strProgramSeriesTitle1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("ProgramSeriesTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_PS").assertValue strProgramSeriesTitle,"9"
							
							.webTable("DetailedData_PS").assertValue strProgramSeriesTitle1,"9"
							
							.webTable("DetailedData_PS").assertDelValue NoRecordFound_msg
							
					        
End with				
'End Test CaseexecutionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramSeriesTitle", "REP_PSR_TC_047"