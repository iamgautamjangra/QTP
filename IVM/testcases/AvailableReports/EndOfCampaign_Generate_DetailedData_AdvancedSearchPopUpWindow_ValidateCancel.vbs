'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel
' Description					:	Validate the cancel operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel","REP_CSR_TC_042"


strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")

strElementNumber=testcasedata.getvalue("strElementNumber")

strTimeRange=testcasedata.getvalue("strTimeRange")

strClockNumber=testcasedata.getvalue("strClockNumber")


DataSet=DATASET_ENDOFCAMPAIGN
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
With ivm.page(report_page)
						.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
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
					

						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait Wait10
End with

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait Wait4
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("ElementNumber_EOC_Adv").setValue strElementNumber
							.webEdit("ProgramPID_Adv").setValue strProgramPID
							.webEdit("ClockNumber_Adv").setValue strClockNumber
							
							.webEdit("TimeRange_EOC_Adv").press
							wait wait2
							strTimeRange=testcasedata.getvalue("strTimeRange")
							.selectlistItem MULTI_LIST_TIMERANGE_EOCDETAILED,strTimeRange,"True"
						   
							.webLink("AdvCancel").press
							
							wait Wait2
							
							.webElement("ProgramPID_Filter").assertExist "False"
							.webElement("TimeRange_Filter").assertExist "False"
							.webElement("ElementNumber_Filter").assertExist "False"
							.webElement("CLockNumber_Filter").assertExist "False"
							
							
							.webTable("DetailedData_EOC").assertExist "True"
							
					
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCancel","REP_CSR_TC_042"