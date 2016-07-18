'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll
' Description					:	Validate the clear all operation on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"

'DataSet1=testcasedata.getvalue("DataSet1")
strEmail1=testcasedata.getvalue("strEmail1")
strStorageLocation1=testcasedata.getvalue("strStorageLocation1")
strReportFormat1=testcasedata.getvalue("strReportFormat1")
strDataType1=testcasedata.getvalue("strDataType1")
strComments1=testcasedata.getvalue("strComments1")
strProgramPID1=testcasedata.getvalue("strProgramPID1")
strChannel1=testcasedata.getvalue("strChannel1")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strClockNumber1=testcasedata.getvalue("strClockNumber1")
strProgramTitle1=testcasedata.getvalue("strProgramTitle1")
strProgramSeriesTitle1=testcasedata.getvalue("strProgramSeriesTitle1")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
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
						

		

		.webEdit("Comments").setValue strComments1
		.webButton("Generate").press
		wait Wait10
End with 

With ivm.page(detailedData_page)
							.webLink("DetailedData").press
							wait Wait5
							
						    .webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("Channel_Adv").setValue strChannel1
							.webEdit("ProgramTitle_Adv").setValue strProgramTitle1
							.webEdit("ClockNumber_Adv").setValue strClockNumber1
							.webEdit("ProgramSeriesTitle_Adv").setValue strProgramSeriesTitle1
							.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"True"
						   
						.webLink("AdvClearAll").press
						wait 5
						.webEdit("ProgramTitle_Adv").assertValue ""
						
						.webEdit("ProgramSeriesTitle_Adv").assertValue ""
						
						.webEdit("ClockNumber_Adv").assertValue ""
						
						.validateSelectedListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID1,"False"
					
						.webEdit("ProgramPID_Adv_ps").assertValue "Type to search..." 'change the logname and and add a object
						
						.webEdit("Channel_Adv").assertValue ""
	
						
						.validateSelectedListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"False"
						
						.webEdit("TimeRange_Adv_ps").assertValue "Type to search..." 'change the logname and and add a object
						
						.validateSelectedListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName1,"False"
						wait Wait2
						
						.webEdit("CampaignName_Adv").assertValue "Type to search..."
						.webLink("AdvCancel").press
						
					
End with


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "ProgramSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateClearAll", "REP_PSR_TC_053"