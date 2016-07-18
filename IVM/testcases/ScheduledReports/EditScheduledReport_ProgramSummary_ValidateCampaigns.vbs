'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_ProgramSummary_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_ProgramSummary_ValidateCampaigns", "SCR_EDIT_PSR_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strCampaignAll=testcasedata.getvalue("strCampaignAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							  wait Wait15	
							  
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
							
						    .assertListItems MULTI_LIST_CAMPAIGN & ";" & reportProgramSummary,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
							wait Wait10
							.assertListDGWDB MULTI_LIST_CAMPAIGN & ";"& reportProgramSummary,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
					  	    wait Wait10
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
						
							 
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
						
							 
							strCampaign=testcasedata.getvalue("strCampaign")
							strCampaign1=testcasedata.getvalue("strCampaign1")
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
							
							strCampaignAll=testcasedata.getvalue("strCampaignAll")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False" '''all items deselected function
							
							strCampaignAll=testcasedata.getvalue("strCampaignAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False" 	
							
							.webButton("Cancel").press

End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_ProgramSummary_ValidateCampaigns", "SCR_EDIT_PSR_TC_005"
