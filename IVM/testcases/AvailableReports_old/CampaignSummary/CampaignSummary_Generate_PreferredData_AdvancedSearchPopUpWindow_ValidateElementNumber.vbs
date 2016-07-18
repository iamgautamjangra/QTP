'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   10-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_CSR_TC_027"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSeachValue=testcasedata.getvalue("strSeachValue")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")
strCampaignName=testcasedata.getvalue("strCampaignName")
strCampaignName1=testcasedata.getvalue("strCampaignName1")
strCampaignNameAll=testcasedata.getvalue("strCampaignNameAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
						 
						.webLink("FilterOptions").assertExist "True"
						.webLink("FilterOptions").assertStatus "Visible"
						.webLink("FilterOptions").press
						wait 5
						
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
					
						.selectDate reportCampaignSummary,"StartDate",START_DATE
                        wait 5
						.selectDate reportCampaignSummary,"EndDate",END_DATE		
						wait 5
                     							
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 5
						
						.selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
						wait 5
						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
						.webList("Grouping").selectItem strGrouping
						wait 3
							
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
						
End with	

With ivm.page(reportgen_page)

							.weblink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_CS").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("Elementnumber").assertExist "True"
							.webEdit("Elementnumber").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_Elementnumber,"All","False"
							
							.assertListItems MULTI_LIST_Elementnumber,""
							
							.selectListItem MULTI_LIST_Elementnumber,strElementnumber,"True"
							 wait 5
							.selectListItem MULTI_LIST_Elementnumber,strElementnumber1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_Elementnumber,strElementnumber,"True"
							.validateSelectedListItem MULTI_LIST_Elementnumber,strElementnumber1,"True"
							
							.selectListItem MULTI_LIST_Elementnumber,strElementnumberAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_Elementnumber,strElementnumberAll,"True" '''all items selected function
							
							strElementnumberAll=testcasedata.getvalue("strElementnumberAll")
							.selectListItem MULTI_LIST_Elementnumber,strElementnumberAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_Elementnumber,strElementnumberAll,"False" '''all items deselected function
							
							strElementnumberAll=testcasedata.getvalue("strElementnumberAll")
							strElementnumber=testcasedata.getvalue("strElementnumber")
							
							.selectListItem MULTI_LIST_Elementnumber,strElementnumberAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_Elementnumber,strElementnumber,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_Elementnumber,strElementnumberAll,"False"
							
							.webLink("AdvClearAll").press
							wait 5	
							
							strElementnumber=testcasedata.getvalue("strElementnumber")
							.selectListItem MULTI_LIST_Elementnumber,strElementnumber,"True"
							wait 5
							
							.webLink("AdvSearch").press
							wait 5
							
							.webTable("SearchCriteria_CS").assertExist "True" 
							.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.weLink("Elementnumber_CS").assertExist "True"
							
							.webTable("PreferredData_CS").assertExist "True"
							
							
							.webTable("PreferredData_CS").assertTableData 'TBD strElementnumber
							wait 5
																													       
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
					.webButton("Cancel").press
					
End with					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_CSR_TC_027"