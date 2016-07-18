'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_UniqueCustomers_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateCampaigns", "SCR_NEW_ASR_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30


strCampaignsAll=testcasedata.getvalue("strCampaignsAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							  wait 15
							
							.webRadiogroup("ReportType").selectGroupItem reportUniqueCustomers
							 wait 8		
							.selectDate "FirstDate", CAMP_FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", CAMP_LAST_DATE
							 wait Wait3
							.webEdit("Campaign").assertExist "True"
							.webEdit("Campaign").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,"All","False"
							
							.assertListItems MULTI_LIST_CAMPAIGN & ";" & reportUniqueCustomers,FIRST_DATE & ";" & LAST_DATE
							wait Wait5
							.assertListDGWDB MULTI_LIST_CAMPAIGN & ";"& reportUniqueCustomers,FIRST_DATE & ";" & LAST_DATE
					  	   wait 8
							
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
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_CAMPAIGN,strCampaignsAll,"False"
							 wait Wait5
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
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateCampaigns", "SCR_NEW_ASR_TC_005"
