'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_FilterAndstrCommentsidateUIControls
' Description					:	Validate the creation of "AdvertisementSummary" with valid data.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_FilterAndstrCommentsidateUIControls", "REP_CSR_TC_012"
   
START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSites=testcasedata.getvalue("strSites")
strSiteGroups=testcasedata.getvalue("strSiteGroups")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportCampaignSummary,3
						 wait 10	
					
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

'Market Details table exist					
with ivm.page(reportgen_page)

							.webLink("BackToPreviousPage").assertExist "True"
							.webLink("BackToPreviousPage").assertStatus "Visible"

							.webElement("CampaignSummary").assertExist "True"
							.webElement("CampaignSummary").assertStatus "Visible"
							
						    .webElement("TimeStamp").assertExist "True"
							.webElement("TimeStamp").assertStatus "Visible"

							.webLink("FiltersAndComments").assertExist "True"
							.webLink("FiltersAndComments").assertStatus "Visible"
							 wait 5

						    .webLink("Actions").assertExist "True"
							.webLink("Actions").assertStatus "Visible"							
							.webLink("Actions").press							
							 wait 5

							.webLink("ExportToPDF").assertExist "True"
							.webLink("ExportToPDF").assertStatus "Visible"
		                     
							.webLink("ExportToCSV").assertExist "True"
							.webLink("ExportToCSV").assertStatus "Visible"
		                     
							.webLink("ExportToXML").assertExist "True"
							.webLink("ExportToXML").assertStatus "Visible"
		                     
							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"
		                     
							.webElement("DateRange").assertExist "True"
							.webElement("DateRange").assertStatus "Visible"
							
							date1=convertDate(START_DATE,"MONTH DATE, YR")
							date2=convertDate(START_DATE,"MONTH DATE, YR")
							
							.assertExistWE date1 & " - " & date2,"True"
							
							.webElement("SitesValue").assertExist "True"
							.webElement("SitesValue").assertStatus "Visible"
							.assertExistWE strSites,"True"
							
							.webElement("SiteGroupsValue").assertExist "True"
							.webElement("SiteGroupsValue").assertStatus "Visible"
							.assertExistWE strSiteGroups,"True"
							
							.webElement("ProviderIdsValue").assertExist "True"
							.webElement("ProviderIdsValue").assertStatus "Visible"
							.assertExistWE strProviderId,"True"
							
							.webElement("CampaignValue").assertExist "True"
							.webElement("CampaignValue").assertStatus "Visible"
							.assertExistWE strCampaign,"True"
							
							.webElement("GroupingValue").assertExist "True"
							.webElement("GroupingValue").assertStatus "Visible"
							.assertExistWE strComments,"True"
							
							.webElement("CommentsValue").assertExist "True"
							.webElement("CommentsValue").assertStatus "Visible"
							.assertExistWE strComments,"True"							
							 
					        .webLink("BackToPreviousPage").press
			                 wait 10
End with

with ivm.page(report_page)
					
					        .webButton("Cancel").press
					        wait 5	

End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_FilterAndstrCommentsidateUIControls", "REP_CSR_TC_012"