'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateGrouping", "SCR_NEW_EOC_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

strGrouping=testcasedata.getvalue("strGrouping")
strGrouping1=testcasedata.getvalue("strGrouping1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait 10
							
								.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
							 wait 8			
							
							.webList("GroupBy").assertExist "True"
							wait 8
							.webList("GroupBy").assertStatus "Visible"
						
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportEndofCampaign
							wait Wait5
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportEndofCampaign," "
							wait Wait5	
							.webList("GroupBy").selectItem strGrouping
							 wait 3
							.webList("GroupBy").assertSelectedItem strGrouping
							
							.webList("GroupBy").selectItem strGrouping1
							 wait 3
							.webList("GroupBy").assertSelectedItem strGrouping1
							wait 3
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateGrouping", "SCR_NEW_EOC_TC_006"
