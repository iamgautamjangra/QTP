'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate 
' Description					:	Validate the date range filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate ", "REP_RDR_TC_038"


strComments=testcasedata.getvalue("strComments")
CampaignStartDate_Inv=testcasedata.getvalue("CampaignStartDate_Inv")

CampaignStartDate_val=testcasedata.getvalue("CampaignStartDate_val")

if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 15
DataSet=DATASET_RAWDATA


With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRawData,3
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
						wait Wait5
End with 

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait Wait4
							
							.webTable("DetailedData_RD").assertExist "True"
							
							.webLink("AdvancedSearch").press
							wait Wait5	
							.webEdit("StartDate_adv").setValue CampaignStartDate_val
							
							.webLink("AdvSearch").press
							 wait Wait5		
							 
							.webElement("StartDate_Filter").assertExist "True"
							If len(CampaignStartDate_val)>9 then 
							.webElement("StartDate_Filter").assertText  "Campaign Start Date ="& mid(CampaignStartDate_val,1,8) &".." &"   X"
							
							Else
							.webElement("StartDate_Filter").assertText  "Campaign Start Date ="& CampaignStartDate_val &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("StartDate_Filter").assertExist "False"
							
' For invalid							
							.webLink("AdvancedSearch").press					
							 wait Wait5	
							 
							.webEdit("StartDate_adv").setValue CampaignStartDate_Inv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
												
							.webElement("StartDate_Filter").assertExist "True"
							If len(CampaignStartDate_Inv)>9 then 
							.webElement("StartDate_Filter").assertText  "Campaign Start Date ="& mid(CampaignStartDate_Inv,1,10) &".." &"   X"
							
							Else
							.webElement("StartDate_Filter").assertText  "Campaign Start Date ="& CampaignStartDate_Inv &"   X"
							End If
							
							
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
											
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("StartDate_Filter").assertExist "False"
							
End with

				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignStartDate ", "REP_RDR_TC_038"