'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_UniqueCustomers_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateGrouping", "SCR_NEW_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30


strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait 15
							
							.webRadiogroup("ReportType").selectGroupItem reportUniqueCustomers
							 wait 8		
							
							.webList("GroupBy").assertStatus "Visible"
							.webList("GroupBy").assertExist "True"
							
									
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportUniqueCustomers
							wait Wait5
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportUniqueCustomers,""
										
							wait Wait5		
							.webList("GroupBy").selectItem strGroupBy
							 wait 3
							.webList("GroupBy").selectItem strGroupBy1
							 wait 3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_UniqueCustomers_ValidateGrouping", "SCR_NEW_ASR_TC_006"
