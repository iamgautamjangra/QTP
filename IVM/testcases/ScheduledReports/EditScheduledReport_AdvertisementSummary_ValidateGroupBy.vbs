'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementSummary_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_ValidateGrouping", "SCR_EDIT_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							  wait Wait15	
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
							
						
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportAdvertisementSummary
							wait Wait2
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportAdvertisementSummary," "
							wait Wait2
								.webList("GroupBy").selectItem strGroupBy
							 wait Wait2
							
							.webList("GroupBy").selectItem strGroupBy1
							 wait Wait2
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementSummary_ValidateGrouping", "SCR_EDIT_ASR_TC_006"
