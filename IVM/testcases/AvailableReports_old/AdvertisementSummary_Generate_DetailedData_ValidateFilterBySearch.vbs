'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch
' Description					:	Validate the serarch functionality on Detailed Data tab.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch", "REP_ASR_TC_039"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strSearchInvalid=testcasedata.getvalue("strSearchInvalid")
strSearchValid=testcasedata.getvalue("strSearchValid")
strSearchBlank=testcasedata.getvalue("strSearchBlank")

status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status="False" Then
Browser("SeaChangeManagementConsole").Refresh
end if

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_ADSUMMARY
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait Wait10
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait Wait5 
						 
						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
						REM .webElement("FilterOptions").press
						REM wait Wait5
							
					    .selectDate reportAdvertisementSummary,"StartDate",START_DATE

						.selectDate reportAdvertisementSummary,"EndDate",END_DATE
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait Wait3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait Wait3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait Wait3
						REM .webList("Grouping").selectItem strGrouping
						REM wait Wait3
							
						.webEdit("Comments").setValue strComments
						wait Wait5
						
						.webButton("Generate").press
						wait Wait8
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait Wait4
							.webTable("DetailedData").assertExist "True"
							
							.webEdit("Search").asserExist "True"
							.webEdit("Search").assertStatus "visible"
							
							.webEdit("Search").setValue strSearchInvalid
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").assertValue NO_RECORD_FOUND,1
							wait Wait5
							
							.webTable("SearchCriteria_AS").assertExist "True"
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
							
							.webTable("DetailedData").assertExist "True"													
					        .webTable("DetailedData").searchData SearchTermValid
							wait Wait5
							
							.webTable("SearchCriteria_AS").assertExist "True"
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

'Search with blank data							
							.webEdit("Search").setValue strSearchBlank
							wait Wait5
							.webImage("Search").press
							wait Wait5
							
							.webTable("DetailedData").assertExist "True"													
					        wait Wait5
							
							.webTable("SearchCriteria_AS").assertExist "True"
							
							.webElement("SearchCriteria").assertExist "False"
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
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_ValidateFilterBySearch", "REP_ASR_TC_039"
