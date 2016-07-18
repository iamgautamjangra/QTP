'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_RegionSummary_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_RegionSummary_ValidateGrouping", "SCR_EDIT_RSR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

SearchVal=testcasedata.getvalue("SearchVal")
strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options","6"
							  wait Wait15	
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
							
							
							
							
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportRegionSummary
							wait Wait5
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportRegionSummary," "
							wait Wait5
							.webList("GroupBy").selectItem strGroupBy
							 wait Wait3
							
							.webList("GroupBy").selectItem strGroupBy1
							 wait Wait3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_RegionSummary_ValidateGrouping", "SCR_EDIT_RSR_TC_006"
