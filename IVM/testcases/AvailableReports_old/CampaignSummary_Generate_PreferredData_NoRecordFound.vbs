'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	CampaignSummary_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   SeaChange
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_NoRecordFound", "REP_CSR_TC_034"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
REM StartDate_val=testcasedata.getvalue("StartDate_val")
REM EndDate_val=testcasedata.getvalue("EndDate_val")
Comments_val=testcasedata.getvalue("Comments_val")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10
' DataSet=DATASET_CAMPAIGNSUMMARY
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait Wait5
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
						 wait Wait7
						
						.webEdit("Comments").setValue Comments_val
						
						
						.webButton("Generate").press
						 wait Wait8
						
End with		

With ivm.page(preferredData_page)
							.webLink("PreferredData").press
							wait Wait4
						
							.webTable("PreferredData_CS").searchData NoRecordFound_msg
                       		.webLink("BackToPreviousPage").press
							wait Wait5
							
							
						
End with

with ivm.page(report_page)

                              .webButton("Cancel").press
							  wait Wait2
 End with
			
					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_NoRecordFound", "REP_CSR_TC_034"