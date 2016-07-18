'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramProvider
' Description					:	Validate the Program Provider filter on advanced search window
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramProvider", "REP_ASR_TC_046"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
ProgramProvider=testcasedata.getvalue("ProgramProvider")
ProgramProviderInv=testcasedata.getvalue("ProgramProviderInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						 wait 10	
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5 
					
					    .webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						REM .webLink("FilterOptions").press
						wait 5
							
						.selectDate reportAdvertisementSummary,"StartDate",START_DATE
                        wait 5
						.selectDate reportAdvertisementSummary,"EndDate",END_DATE		
						wait 5
                     							
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 5
						
						REM .selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						REM wait 5
						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
						REM .webList("Grouping").selectItem strGrouping
						REM wait 3
						
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
						
End with	

With ivm.page(reportgen_page)	

							.webLink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_AS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramProvider").setValue ProgramProvider
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							strElement= ProgramProvider
							.webTable("DetailedData_AS").assertExist "True"
							.webTable("DetailedData_AS").searchData strElement
							
							.webTable("SearchCriteria_AS").assertExist "True" 
							.webTable("SearchCriteria_AS").assertStatus "Visible"
							.webElement("SearchCriteria").assertStatus "Visible"
							
							.weLink("ProgramProvider_AS").assertExist "True"
							.webLink("ProgramProvider_AS").assertStatus "Visible"
							
							
							
							.webLink("ClearAll_AS").assertExist "True"
							.webLink("ClearAll_AS").assertStatus "Visible"
							
							.webLink("ProgramProvider_AS").press							
							 wait 5
							
							.webLink("ProgramProvider_AS").assertExist "False"
							.webLink("ClearAll_AS").assertExist "False"
							
							
							wait 5	
'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramProvider").setValue ProgramProviderInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria_AS").assertExist "True" 
							.webTable("SearchCriteria_AS").assertStatus "Visible"
							
							.weLink("ProgramProvider_AS").assertExist "True"
							
							.webTable("DetailedData_AS").assertExist "True"
						
							.webTable("DetailedData_AS").assertvalue "No data exists for the selected criteria."
							wait 5
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							wait 5
End with					
DetailedData_AS					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramProvider", "REP_ASR_TC_046"