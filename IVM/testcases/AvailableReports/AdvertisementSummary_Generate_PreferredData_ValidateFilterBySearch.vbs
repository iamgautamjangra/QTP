'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch
' Description					:   Validate the serarch functionality on Preferred Data tab..
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch", "REP_ASR_TC_023"

strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")

DataSet=DATASET_ADSUMMARY
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if
ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
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
						wait Wait7


						.selectListItem MULTI_LIST_PROVIDER,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait3

						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(preferredData_page)

							.weblink("PreferredData").press
							wait Wait4
							.webTable("PreferredData").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").assertValue NoRecordFound_msg,1
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_AS").assertExist "True"
							.webLink("Search_AS").assertStatus "Visible"
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("Search_AS").press							
							 wait Wait5
							
							.webLink("Search_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
'Search with valid data
							.webEdit("Search").setValue strSearchValid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("PreferredData").assertExist "True"													
					        .webTable("PreferredData").searchData strSearchValid
							wait Wait5
							
							.webElement("SearchCriteria").assertExist "True"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.webLink("Search_AS").assertExist "True"
							.webLink("Search_AS").assertStatus "Visible"
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("Search_AS").press							
							 wait Wait5
							
							.webLink("Search_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
					       .webLink("BackToPreviousPage").press
						    wait Wait10
			
End with

with ivm.page(report_page)		
								
							.webButton("Cancel").press
							wait Wait5
					
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateFilterBySearch", "REP_ASR_TC_023"
