'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_ModifiedFilters_GenerateReport
' Description					:	Validate the "Campaign Summary " with modified filters.
' Author 						:   SeaChange
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_ModifiedFilters_GenerateReport", "REP_CSR_TC_013"


DataSet1=testcasedata.getvalue("DataSet1")

strTimeRange1=testcasedata.getvalue("strTimeRange1")
strCampaign1=testcasedata.getvalue("strCampaign1")
strProgramPID=testcasedata.getvalue("strProgramPID")
strComments1=testcasedata.getvalue("strComments1")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportProgramSummary,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet1,1 
						wait Wait7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
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
							.assertExistWE strTimeRange1,"True"
							
							.webElement("Campaigns").assertExist "True"
							.webElement("Campaigns").assertStatus "Visible"
							.assertExistWE strCampaign1,"True"
							
							.webElement("ProgramPid").assertExist "True"
							.webElement("ProgramPid").assertStatus "Visible"
							.assertExistWE strProgramPid,"True"
						
							.webElement("Comments").assertExist "True"
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments1
						
End With
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_ModifiedFilters_GenerateReport", "REP_CSR_TC_013"	