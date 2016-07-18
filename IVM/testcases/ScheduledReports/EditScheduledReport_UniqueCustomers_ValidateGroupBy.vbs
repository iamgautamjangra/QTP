'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_UniqueCustomers_ValidateGrouping
' Description					:	Validate "Grouping" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_UniqueCustomers_ValidateGrouping", "SCR_EDIT_ASR_TC_006"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 30

SearchVal=testcasedata.getvalue("SearchVal")
strGroupBy=testcasedata.getvalue("strGroupBy")
strGroupBy1=testcasedata.getvalue("strGroupBy1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink  SearchVal,"Edit Options",6
							  wait 15	
							
							.webList("GroupBy").assertExist "True"
							.webList("GroupBy").assertStatus "Visible"
							
						
							.webList("GroupBy").assertlistitems "GroupBy"& ";" & reportUniqueCustomers
							wait Wait5
							.webList("GroupBy").assertListDGWDB "GroupBy" & ";"& reportUniqueCustomers," "
							wait Wait5
							.webList("GroupBy").selectItem strGroupBy
							 wait 3
							
							.webList("GroupBy").selectItem strGroupBy1
							 wait 3
							.webList("GroupBy").assertSelectedItem strGroupBy1
							
							.webButton("Cancel").press

End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_UniqueCustomers_ValidateGrouping", "SCR_EDIT_ASR_TC_006"
