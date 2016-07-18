'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_CampaignSummary_ValidateGroupBy
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_ValidateGroupBy", "SCR_NEW_CSR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30


strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							  wait Wait15
							
							.webRadiogroup("ReportType").selectGroupItem reportCampaignSummary
							 wait Wait8		
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
									
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportCampaignSummary
							wait Wait2
										
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportCampaignSummary," "
							wait Wait2		
							
							.webList("GroupBy").selectItem strGroupBy
						
							.webList("GroupBy").assertSelectedItem strGroupBy
							.webList("GroupBy").selectItem strGroupBy1
							
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_CampaignSummary_ValidateGroupBy", "SCR_NEW_CSR_TC_006"
