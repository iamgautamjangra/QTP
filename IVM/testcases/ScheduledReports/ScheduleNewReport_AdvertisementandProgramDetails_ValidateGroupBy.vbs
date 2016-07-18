'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AdvertisementandProgramDetails_ValidateGroupBy
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementandProgramDetails_ValidateGroupBy", "SCR_NEW_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait15


strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait Wait10
							
							.webRadiogroup("ReportType").selectGroupItem reportAdvertisementandProgramDetails
							 wait Wait8		
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
									
							.webList("GroupBy").selectItem strGroupBy
							 wait Wait3
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportAdvertisementandProgramDetails
							wait Wait5
										
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportAdvertisementandProgramDetails," "
							wait Wait5			
							.webList("GroupBy").selectItem strGroupBy1
							 wait Wait3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AdvertisementandProgramDetails_ValidateGroupBy", "SCR_NEW_ASR_TC_006"
