'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AllDetails_ValidateSites
' Description					:	Validate "Sites" List box.
' Author 						:   SeaChange
' Date 							:   16-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateSites", "SCR_NEW_ADR_TC_002"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strSitesAll=testcasedata.getvalue("strSitesAll")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait Wait10
							
							.webRadiogroup("ReportType").selectGroupItem reportAllDetails
							 wait Wait12	
							.selectDate "FirstDate", FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", LAST_DATE
							 wait Wait3
							
							.webEdit("Sites").assertExist "True"
							.webEdit("Sites").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_SITES,"All","False"
							
							.assertListItems MULTI_LIST_SITES & ";" & reportAllDetails,""
							wait Wait5
							.assertListDGWDB MULTI_LIST_SITES & ";"& reportAllDetails, ""
					  	     wait Wait5
							
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
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateSites", "SCR_NEW_ADR_TC_002"
