'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_AllDetails_ValidateProviderIDs
' Description					:	Validate "Provider Ids" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateProviderIDs", "SCR_NEW_ADR_TC_004"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

ReportName=testcasedata.getvalue("ReportName")
strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait 10
							
							.webRadiogroup("ReportType").selectGroupItem ReportName
							 wait 8		
							.selectDate "FirstDate", FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", LAST_DATE
							 wait Wait3							
							.webEdit("ProviderIDs").assertExist "True"
							.webEdit("ProviderIDs").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,"All","False"
							
							.assertListItems MULTI_LIST_PROVIDERIDS,""
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							 wait Wait3
							 
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							 wait Wait3
							 
							strProviderId=testcasedata.getvalue("strProviderId")
							strProviderId1=testcasedata.getvalue("strProviderId1")
							
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True"
							 wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False"
							 wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" '''all items deselected function
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							strProviderId=testcasedata.getvalue("strProviderId")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True"
							 wait Wait3
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"False"
							 wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" 	
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_AllDetails_ValidateProviderIDs", "SCR_NEW_ADR_TC_004"
