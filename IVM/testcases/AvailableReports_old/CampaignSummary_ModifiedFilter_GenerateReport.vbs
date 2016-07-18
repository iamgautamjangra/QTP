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
strComments1=testcasedata.getvalue("strComments1")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait15
DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5	
						 .webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait Wait5
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange1,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign1,"True"
						wait Wait5
					    
						.webEdit("Comments").setValue strComments1
		
						.webButton("Generate").press
						wait Wait5

End with
With ivm.page(preferredData_page)
                           
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							
							.assertExistWE strTimeRange1,"True"
					
							REM .webElement("CampaignNames").assertExist "True"
							REM .webElement("CampaignNames").assertStatus "Visible"
							wait 2
							REM .assertExistWE strCampaign1,"True"				
							.webElement("Comments").assertExist "True"
						
							.webElement("Comments").assertStatus "Visible"
							.webElement("Comments_val").assertExist "True"
							.webElement("Comments_val").assertStatus "Visible"
							.webElement("Comments_val").assertText strComments1
						
End With
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_ModifiedFilters_GenerateReport", "REP_CSR_TC_013"	