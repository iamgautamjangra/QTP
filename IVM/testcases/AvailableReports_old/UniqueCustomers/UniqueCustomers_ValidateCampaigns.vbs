'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_ValidateCampaigns
' Description					:	Validate the Campaigns multiselect list box.
' Author 						:   Fonantrix Solution
' Date 							: 05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_ValidateCampaigns", "REP_UCR_TC_016"

strSeachValue=testcasedata.getvalue("strSeachValue")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
							 wait 10	
							 
							.webTable("SelectaDatasetforThisReport").assertExist "True"
															
										 
						    .webTable("DataSet").presstblRadioBtn strSeachValue,1 
							wait 5
							
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
							REM .webLink("FilterOptions").press
							REM wait 5
							
							.webEdit("Campaigns").assertExist "True"
							.webEdit("Campaigns").assertStatus "Visible"
							.webEdit("Campaigns").assertValue "Type to search..."
							
													
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True" '''all items selected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaign1,"False"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press
							wait 5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_ValidateCampaigns", "REP_UCR_TC_016"