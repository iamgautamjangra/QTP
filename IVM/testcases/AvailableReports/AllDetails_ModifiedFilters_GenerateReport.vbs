'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_ModifiedFilters_GenerateReport
' Description					:	Validate the "Advertisement Summary " with modified filters.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_ModifiedFilters_GenerateReport", "REP_CSR_TC_013"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(5)
If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

'DataSet1=testcasedata.getvalue("DataSet1")
strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strComments1=testcasedata.getvalue("strComments1")

If status="False" Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
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
							wait Wait10
						
						strTimeRange1=testcasedata.getvalue("strTimeRange1")
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						wait wait2
						
						strCampaign1=testcasedata.getvalue("strCampaign1")
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
						wait wait2
						
						strProgramPID=testcasedata.getvalue("strProgramPID")
						.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
						wait Wait2
					   
						.webEdit("Comments").setValue strComments1
		
						.webButton("Generate").press
						wait Wait8

End with
With ivm.page(preferredData_page)

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							
							
							
							.webElement("ProgramPid").assertExist "True"
							.webElement("ProgramPid").assertStatus "Visible"
							
						
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments1
						
End With	
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_ModifiedFilters_GenerateReport", "REP_CSR_TC_013"	