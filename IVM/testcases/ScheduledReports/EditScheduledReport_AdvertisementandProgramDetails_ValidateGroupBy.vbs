'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementandProgramDetails_ValidateGroupBy
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_ValidateGroupBy", "SCR_EDIT_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait15

SearchVal=testcasedata.getvalue("SearchVal")
strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							 wait Wait10	
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportAdvertisementandProgramDetails
							wait Wait5
										
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportAdvertisementandProgramDetails," "
							wait Wait5	
							
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
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_ValidateGroupBy", "SCR_EDIT_ASR_TC_006"
