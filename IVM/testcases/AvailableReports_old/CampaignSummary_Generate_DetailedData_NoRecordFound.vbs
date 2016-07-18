'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_DetailedData_NoRecordFound
' Description					:	Validate the messge No record found for detailed data 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_NoRecordFound", "REP_CSR_TC_048"

strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
DataSet=testcasedata.getvalue("DataSet")
strComments=testcasedata.getvalue("strComments")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
'DataSet=DATASET_CAMPAIGNSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
						 
						.webLink("AdvancedSearch").press
						wait Wait3
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait5
						
						
					status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						if status="False" Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
						end if
						 
					  .webTable("DataSet").presstblRadioBtn DataSet,1
	              			wait wait7		
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait7
							.webTable("DetailedData_CS").assertExist "True"
							
							.webTable("DetailedData_CS").searchData NoRecordFound_msg
							wait Wait5
						
							.webLink("BackToPreviousPage").press
							wait Wait10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_DetailedData_NoRecordFound", "REP_CSR_TC_048"