'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"

'DataSet=testcasedata.getvalue("DataSet")

strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strProgramPID=testcasedata.getvalue("strProgramPID")
strElementNumber=testcasedata.getvalue("strElementNumber")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
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
							strTimeRange=testcasedata.getvalue("strTimeRange")
							.selectListItem MULTI_LIST_TIMERANGE_EOCDETAILED,strTimeRange,"True"
							wait wait5
							
						   			        
							
							.webLink("AdvClearAll").press
							
							wait Wait2
							
							.webEdit("ElementNumber_EOC_Adv").assertValue ""
							.webEdit("ClockNumber_Adv").assertValue ""
							
													
							
						
							.webEdit("TimeRange_EOC_Adv").assertValue "Type to search..."
					
							.validateSelectedListItem MULTI_LIST_TIMERANGE_EOCDETAILED,strTimeRange,"False"
							
														
							.webLink("AdvCancel").press
							
							
						
End With
				  
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_CSR_TC_043"