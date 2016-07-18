'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AllDetails_ValidateGroupBy
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateGroupBy", "SCR_NEW_ADR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait Wait10
							
							.webRadiogroup("ReportType").selectGroupItem reportAllDetails
							 wait Wait8		
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
									
							.webList("GroupBy").selectItem strGroupBy
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportAllDetails
							wait Wait5
										
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportAllDetails," "
							wait Wait5			
							.webList("GroupBy").selectItem strGroupBy1
						
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateGroupBy", "SCR_NEW_ADR_TC_006"
