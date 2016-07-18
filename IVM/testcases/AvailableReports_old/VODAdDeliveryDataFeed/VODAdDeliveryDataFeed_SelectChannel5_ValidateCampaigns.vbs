'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	VODAdDeliveryDataFeed_SelectChannel5_ValidateCampaigns
' Description					:	Validate the Campaigns multiselect list box.
' Author 						:   Fonantrix Solution
' Date 							:   14-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_SelectChannel5_ValidateCampaigns", "REP_VOD_TC_018"

strSeachValue=testcasedata.getvalue("strSeachValue")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
							 wait 10	
							
							.webTable("SelectaDatasetforThisReport").assertExist "True"
						    .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "DataCreation","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                            .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
						
						 	
										 
						    .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
							
							.webLink("FilterOptions").assertExist "True"
						    .webLink("FilterOptions").assertStatus "Visible"
							.webLink("FilterOptions").press
							wait 5
							
							.webList("SelectaProveder").assertExist "True"
						    .webList("SelectaProveder").selectItem strProvider
							 wait 5
							
							.webEdit("Campaigns").assertExist "True"
							.webEdit("Campaigns").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGNS,""
							
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
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" '''all items deselected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_CAMPAIGNS,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "VODAdDeliveryDataFeed_SelectChannel5_ValidateCampaigns", "REP_VOD_TC_018"