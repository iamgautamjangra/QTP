'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_NoRecordFound
' Description					:	Validate the messge No record found for preferred data 
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_NoRecordFound", "REP_ASR_TC_034"


'select Campaigns and Provider  for which there is  no data in database
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
DataSet=DATASET_ADSUMMARY
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
 
with ivm.page(report_page)

					     .webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
					     wait Wait5
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
						wait Wait7

						.selectListItem MULTI_LIST_PROVIDER,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait3
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait Wait8
						
End with	

With ivm.page(preferredData_page)	

						.webLink("PreferredData").press
						wait Wait5
						
						.webTable("PreferredData").assertValue NoRecordFound_msg,1
						
						.webLink("BackToPreviousPage").press
							wait Wait10	
End with 							
With ivm.page(report_page)		
 
						    .webButton("Cancel").press
						     wait Wait10
							
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
		

End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_NoRecordFound", "REP_ASR_TC_034"