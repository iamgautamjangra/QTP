'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport
' Description					:	To validate the pre-populated values displayed when user generates a report without changing the filter criteria.
' Author 						:   Fonantrix Solution
' Date 							:   08-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport", "REP_CSR_TC_012"


strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait Wait10	
						 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
						wait Wait7
									
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait2
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					    .webList("Provider").selectItem strProvider
						 wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8

End with
With ivm.page(preferredData_page)

							.webElement("FilterOptions").assertExist "True"
							.webElement("FilterOptions").assertStatus "Visible"

							.webElement("TimeRange").assertExist "True"
							.webElement("TimeRange").assertStatus "Visible"
							.assertExistWE strTimeRange,"True"
							
							
							.webElement("SelectedProviderIs").assertExist "True"
							.webElement("SelectedProviderIs").assertStatus "Visible"
							.assertExistWE strProvider,"True"
							
							'.webElement("CampaignName").assertExist "True"
							'.webElement("CampaignName").assertStatus "Visible"
							'.assertExistWE strCampaign,"True"
						
						
						
End With
						
						
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_ModifiedFilters_GenerateReport", "REP_CSR_TC_012"	