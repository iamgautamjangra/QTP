'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_ProgramSummary_ValidateSites
' Description					:	Validate "Sites" List box.
' Author 						:   SeaChange
' Date 							:   02-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_ValidateSites", "SCR_NEW_PSR_TC_002"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

strSitesAll=testcasedata.getvalue("strSitesAll")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							  wait Wait15
							
							.webRadiogroup("ReportType").selectGroupItem reportProgramSummary
							 wait Wait12	
							.selectDate "FirstDate", FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", LAST_DATE
							 wait Wait3
							
							.webEdit("Sites").assertExist "True"
							.webEdit("Sites").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_SITES,"All","False"
							
							.assertListItems MULTI_LIST_SITES & ";" & reportProgramSummary,""
							wait Wait5
							.assertListDGWDB MULTI_LIST_SITES & ";"& reportProgramSummary, ""
					  	     wait Wait8
							
							.selectListItem MULTI_LIST_SITES,strSites,"True"
							 wait Wait2
							
							.selectListItem MULTI_LIST_SITES,strSites1,"True"
							 wait Wait2
							
							strSites=testcasedata.getvalue("strSites")
							strSites1=testcasedata.getvalue("strSites1")
							
							.validateSelectedListItem MULTI_LIST_SITES,strSites,"True"
							.validateSelectedListItem MULTI_LIST_SITES,strSites1,"True"
							
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
							wait Wait2
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" '''all items deselected function
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							strSites=testcasedata.getvalue("strSites")
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait Wait2
							 
							.selectListItem MULTI_LIST_SITES,strSites,"False"
							 wait Wait2
							 
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" 	
							
							.webButton("Cancel").press

End With
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_ProgramSummary_ValidateSites", "SCR_NEW_PSR_TC_002"
