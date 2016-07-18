'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_ValidateCampaign
' Description					:	Validate "Campaign" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateCampaign", "SCR_NEW_EOC_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait Wait10
							.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
							 wait 8
							  .selectDate "FirstDate", CAMP_CAMP_FIRST_DATE
									
								wait Wait3
									
							.selectDate "LastDate", CAMP_CAMP_LAST_DATE
							 wait Wait3
							
							 .webList("Campaign").assertStatus "Visible"
							.webList("Campaign").assertExist "True"
														
							.webList("Campaign").assertlistitems "Campaign"& ";" & reportEndofCampaign
							wait Wait5
							.webList("Campaign").assertListDGWDB "Campaign" & ";"& reportEndofCampaign,CAMP_FIRST_DATE & ";"& CAMP_LAST_DATE
							wait Wait5
							.webList("Campaign").selectItem strCampaign
							 wait 3
							.webList("Campaign").assertSelectedItem strCampaign
							
							.webList("Campaign").selectItem strCampaign1
							 wait 3
							.webList("Campaign").assertSelectedItem strCampaign1
							
							.webButton("Cancel").press


End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateCampaign", "SCR_NEW_EOC_TC_005"
