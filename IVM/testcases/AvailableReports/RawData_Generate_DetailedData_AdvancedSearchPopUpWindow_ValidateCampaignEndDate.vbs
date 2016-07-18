'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignEndDate 
' Description					:	Validate the date range filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignEndDate ", "REP_RDR_TC_038"


strComments=testcasedata.getvalue("strComments")
CampaignEndDate_Inv=testcasedata.getvalue("CampaignEndDate_Inv")
CampaignEndDate_val=testcasedata.getvalue("CampaignEndDate_val")

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
							.webEdit("EndDate_adv").setValue CampaignEndDate_val
							
							.webLink("AdvSearch").press
							 wait Wait5		
							 
							.webElement("EndDate_Filter").assertExist "True"
							If len(CampaignEndDate_val)>9 then 
							.webElement("EndDate_Filter").assertText  "Campaign End Date ="& mid(CampaignEndDate_val,1,8) &".." &"   X"
							
							Else
							.webElement("EndDate_Filter").assertText  "Campaign End Date ="& CampaignEndDate_val &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webLink("ClearAll").press
							wait Wait5
							.webElement("EndDate_Filter").assertExist "False"
							
' For invalid							
							.webLink("AdvancedSearch").press					
							 wait Wait5	
							 
							.webEdit("EndDate_adv").setValue CampaignEndDate_Inv
						    wait Wait2
							.webLink("AdvSearch").press
							wait Wait5	
							
												
							.webElement("EndDate_Filter").assertExist "True"
							If len(CampaignEndDate_Inv)>9 then 
							.webElement("EndDate_Filter").assertText  "Campaign End Date ="& mid(CampaignEndDate_Inv,1,10) &".." &"   X"
							
							Else
							.webElement("EndDate_Filter").assertText  "Campaign End Date ="& CampaignEndDate_Inv &"   X"
							End If
							
							.webElement("EndDate_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
											
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("EndDate_Filter").assertExist "False"
							
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateCampaignEndDate ", "REP_RDR_TC_038"