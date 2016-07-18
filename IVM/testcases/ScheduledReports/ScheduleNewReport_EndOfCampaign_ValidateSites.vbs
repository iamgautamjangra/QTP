'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_ValidateSites
' Description					:	Validate "Sites" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateSites", "SCR_NEW_EOC_TC_002"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15


strSitesAll=testcasedata.getvalue("strSitesAll")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")

 With ivm.page(ScheduledReports_Page)

								.webLink("ScheduleNewReport").press
								wait Wait10

								.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
								wait Wait8
								.selectDate "FirstDate", FIRST_DATE
								wait Wait3									
								.selectDate "LastDate", LAST_DATE
								wait Wait3

								.webEdit("Sites").assertExist "True"
								.webEdit("Sites").assertStatus "Visible"
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,"All","False"
								wait Wait2
								.assertListItems MULTI_LIST_SITES & ";" & reportEndofCampaign,""
								wait Wait5
								.assertListDGWDB MULTI_LIST_SITES & ";"& reportEndofCampaign, ""
								wait 8
								.selectListItem MULTI_LIST_SITES,strSites,"True"
								wait Wait5

								.selectListItem MULTI_LIST_SITES,strSites1,"True"
								wait Wait5

												
								.validateSelectedListItem MULTI_LIST_SITES,strSites,"True"
								 wait Wait5
								.validateSelectedListItem MULTI_LIST_SITES,strSites1,"True"
								 wait Wait5


								strSitesAll=testcasedata.getvalue("strSitesAll")

								.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"True" '''all items selected function
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSites,"True"
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSites1,"True"
								 wait Wait2
								.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" '''all items deselected function
								wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSites,"False"
								 wait Wait2
								.validateSelectedListItem MULTI_LIST_SITES,strSites1,"False"
								 wait Wait2
													
								.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
								wait Wait2

								.selectListItem MULTI_LIST_SITES,strSites,"False"
								wait Wait2

								.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" 	
								wait Wait5
								.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateSites", "SCR_NEW_EOC_TC_002"
