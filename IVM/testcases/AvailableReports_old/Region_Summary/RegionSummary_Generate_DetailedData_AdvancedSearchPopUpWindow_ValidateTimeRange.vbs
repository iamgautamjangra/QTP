'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange 
' Description					:	Validate the Time range filter using advanced search
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_RSR_TC_046"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
TimeRange_val=testcasedata.getvalue("TimeRange_val")
TimeRange_val1=testcasedata.getvalue("TimeRange_val1")
TimeRange_Inv=testcasedata.getvalue("TimeRange_Inv")
TimeRange_Inv1=testcasedata.getvalue("TimeRange_Inv1")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
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
						REM wait 5

						   
					    .selectDate reportRegionSummary,"StartDate",START_DATE

						.selectDate reportRegionSummary,"EndDate",END_DATE
						
						REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						REM wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
						REM .webList("Grouping").selectItem strGrouping
						REM wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webButton("Generate").press
						wait 5
End with 

With ivm.page(reportgen_page)

							.weblink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RS").assertExist "True"
							
							.webLink("AdvancedSearch").press
							wait 5	
							
							.selectDate reportRegionSummary,"StartDate",TimeRange_val	
							wait 5
							.selectDate reportRegionSummary,"EndDate",TimeRange_val1
							wait 5
							.webLink("AdvSearch").press
							 wait 5		
							 
							.webTable("SearchCriteria_RS").assertExist "True" 
							.webTable("SearchCriteria_RS").assertStatus "Visible"
							
							.webLink("TimeRange_RS").assertExist "True"
							.webLink("TimeRange_RS").assertStatus "Visible"
							 
							 strFromTo= "From " & TimeRange_val & " to " & TimeRange_val1	
							 
							.webTable("DetailedData_RS").searchData strFromTo
							wait 5
							
' For invalid							
							.webLink("AdvancedSearch").press					
							 wait 5	
							 
							.selectDate reportRegionSummary,"StartDate",TimeRange_Inv	
							wait 5							
							.selectDate reportRegionSummary,"EndDate",TimeRange_Inv1	
							wait 5
							.webLink("AdvSearch").press					
							 wait 5		
							 
							.webTable("SearchCriteria_RS").assertExist "True" 
							.webTable("SearchCriteria_RS").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertvalue "No data exists for the selected criteria."
							 wait 5
							 
							.webLink("BackToPreviousPage").press
							 wait 10
End with

with ivm.page(report_page)	
							
							.webButton("Cancel").press
							wait 5
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateTimeRange ", "REP_RSR_TC_046"