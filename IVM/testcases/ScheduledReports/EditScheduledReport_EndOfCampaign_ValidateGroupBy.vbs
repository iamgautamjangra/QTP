'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_EndOfCampaign_ValidateGroupBy
' Description					:	Validate "GroupBy" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_ValidateGroupBy", "SCR_EDIT_EOC_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 20

SearchVal=testcasedata.getvalue("SearchVal")
strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							 wait 15	
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportEndofCampaign
							wait Wait5
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportEndofCampaign," "
							wait Wait5
							.webList("GroupBy").selectItem strGroupBy
							 wait 3
							.webList("GroupBy").assertSelectedItem strGroupBy
							
							.webList("GroupBy").selectItem strGroupBy1
							 wait 3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_EndOfCampaign_ValidateGroupBy", "SCR_EDIT_EOC_TC_006"
