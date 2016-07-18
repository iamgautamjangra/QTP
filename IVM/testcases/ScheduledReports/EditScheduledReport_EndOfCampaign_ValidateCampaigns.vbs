'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_EndOfCampaign_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_ValidateCampaigns", "SCR_EDIT_EOC_TC_005"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

SearchVal=testcasedata.getvalue("SearchVal")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							 wait 15	
							  .selectDate "FirstDate", CAMP_FIRST_DATE
									
								wait Wait3
									
							.selectDate "LastDate", CAMP_LAST_DATE
							 wait Wait3
							.webList("Campaign").assertStatus "Visible"
							.webList("Campaign").assertExist "True"
							
							
							.webList("Campaign").assertlistitems "Campaign"& ";" & reportEndofCampaign
							wait Wait5
							.webList("Campaign").assertListDGWDB "Campaign" & ";"& reportEndofCampaign,FIRST_DATE & ";"& LAST_DATE
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
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_ValidateCampaigns", "SCR_EDIT_EOC_TC_005"
