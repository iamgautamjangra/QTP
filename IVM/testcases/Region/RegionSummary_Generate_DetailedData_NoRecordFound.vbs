'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_NoRecordFound
' Description					:	Validate the message displayed in the table in case of no data. 
' Author 						:   Fonantrix Solution
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_NoRecordFound", "REP_RSR_TC_056"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaignName=testcasedata.getvalue("strCampaignName")
strSeachValue=testcasedata.getvalue("strSeachValue")
strComments=testcasedata.getvalue("strComments")


ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
Dataset=DATASET_REGIONSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait Wait10
						 
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait Wait3
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
						
						.selectlistItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectlistItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaignName,"True"
						
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_RS").assertExist "True"
							.webTable("DetailedData_RS").assertValue NoRecordFound_msg,1
							wait Wait5
						
							.webLink("BackToPreviousPage").press
							wait Wait10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_NoRecordFound", "REP_RSR_TC_056"