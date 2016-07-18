'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AllDetails_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AllDetails_ValidateCampaigns", "SCR_EDIT_ADR_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testcasedata.getvalue("SearchVal")
strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							 wait Wait10	
							 
							  .selectDate "FirstDate", CAMP_FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", CAMP_LAST_DATE
							 wait Wait3
							
							.webEdit("Campaign").assertExist "True"
							.webEdit("Campaign").assertStatus "Visible"
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
							 wait Wait2
							 
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,"All","False"
							
						   .assertListItems MULTI_LIST_CAMPAIGN & ";" & reportAllDetails,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
							wait Wait5
							.assertListDGWDB MULTI_LIST_CAMPAIGN & ";"& reportAllDetails,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
					  	    wait Wait5
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							 wait Wait2
							 
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
							 wait Wait2
							 
							strCampaign=testcasedata.getvalue("strCampaign")
							strCampaign1=testcasedata.getvalue("strCampaign1")
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False" '''all items deselected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AllDetails_ValidateCampaigns", "SCR_EDIT_ADR_TC_005"
