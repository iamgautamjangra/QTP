'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AdvertisementSummary_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementSummary_ValidateGrouping", "SCR_NEW_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30


strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							  wait Wait15
							
							.webRadiogroup("ReportType").selectGroupItem reportAdvertisementSummary
							 wait Wait8		
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
									
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportAdvertisementSummary
							wait Wait5
										
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportAdvertisementSummary," "
							wait Wait5			
							
							.webList("GroupBy").selectItem strGroupBy
							 wait Wait3
							 .webList("GroupBy").assertSelectedItem strGroupBy
							 
							.webList("GroupBy").selectItem strGroupBy1
							 wait Wait3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementSummary_ValidateGrouping", "SCR_NEW_ASR_TC_006"
