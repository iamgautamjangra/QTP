'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_NoRecordFound
' Description					:	Validate the message displayed in the table in case of no data. 
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_NoRecordFound", "REP_ASR_TC_057"

strTimeRange=testcasedata.getvalue("strTimeRange")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

'strDataSet for which there is no data in database
strDataSet=testcasedata.getvalue("strDataSet")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait Wait10
						 
						..webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue strDataSet
						.webLink("AdvSearch").press
						wait wait10

						status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status=False Then
						Browser("SeaChangeManagementConsole").Refresh
						wait wait8
						.webLink("AdvancedSearch").press
						wait Wait8
						.webEdit("DatasetName").setValue strDataSet
						.webLink("AdvSearch").press
						wait wait8
						end if

						.webTable("DataSet").presstblRadioBtn strDataSet,1 
						wait Wait7
					    .selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait3
																						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(DetailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData").assertExist "True"
							.webTable("DetailedData").assertValue NoRecordFound_msg,1
							wait Wait5
						
							.webLink("BackToPreviousPage").press
							wait Wait10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_NoRecordFound", "REP_ASR_TC_057"