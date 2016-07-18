'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ProgramSummary_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_ValidateCampaigns", "SCR_NEW_PSR_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							  wait Wait15
							
							.webRadiogroup("ReportType").selectGroupItem reportProgramSummary
							 wait Wait8	
                           .selectDate "FirstDate", CAMP_CAMP_FIRST_DATE									
								wait Wait3
							.selectDate "LastDate", CAMP_CAMP_LAST_DATE
							 wait Wait3							 
							
							.webEdit("Campaign").assertExist "True"
							.webEdit("Campaign").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,"All","False"
							
							  .assertListItems MULTI_LIST_CAMPAIGN & ";" & reportProgramSummary,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
							wait Wait10
							.assertListDGWDB MULTI_LIST_CAMPAIGN & ";"& reportProgramSummary,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
					  	    wait Wait10
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							 wait Wait5
							 
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
							 wait Wait5
							 
							strCampaign=testcasedata.getvalue("strCampaign")
							strCampaign1=testcasedata.getvalue("strCampaign1")
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True"
							 wait Wait7
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False"
							 wait Wait7
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False" '''all items deselected function
							
							strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
							strCampaign=testcasedata.getvalue("strCampaign")
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False" 	
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_ValidateCampaigns", "SCR_NEW_PSR_TC_005"
