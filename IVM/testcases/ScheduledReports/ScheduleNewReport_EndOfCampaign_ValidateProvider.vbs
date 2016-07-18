'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_EndOfCampaign_ValidateProviderIDs
' Description					:	Validate "Provider Ids" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateProviderIDs", "SCR_NEW_EOC_TC_004"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait 15

strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")

 With ivm.page(ScheduledReports_Page)

							.webLink("ScheduleNewReport").press
							 wait Wait10
							
							.webRadiogroup("ReportType").selectGroupItem reportEndofCampaign
							 wait Wait8	
							.selectDate "FirstDate", FIRST_DATE
							wait Wait3									
							.selectDate "LastDate", LAST_DATE
							 wait Wait3							
							.webEdit("Provider").assertExist "True"
							.webEdit("Provider").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_PROVIDER,"All","False"
							
								.assertListItems MULTI_LIST_PROVIDER & ";" & reportEndofCampaign,""
							wait Wait5
							.assertListDGWDB MULTI_LIST_PROVIDER & ";"& reportEndofCampaign, ""
							wait Wait5
														
							.selectListItem MULTI_LIST_PROVIDER,strProviderId,"True"
							 wait Wait5
							 
							.selectListItem MULTI_LIST_PROVIDER,strProviderId1,"True"
							 wait Wait5
							 
							strProviderId=testcasedata.getvalue("strProviderId")
							strProviderId1=testcasedata.getvalue("strProviderId1")
							
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId,"True"
							wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId1,"True"
							wait Wait3
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							strProviderId=testcasedata.getvalue("strProviderId")
							strProviderId1=testcasedata.getvalue("strProviderId1")
							.selectListItem MULTI_LIST_PROVIDER,strProviderIdAll,"True"
							 wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderIdAll,"True" '''all items selected function
							wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId,"True"
							wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId1,"True"
							wait Wait3
							.selectListItem MULTI_LIST_PROVIDER,strProviderIdAll,"False"
							 wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderIdAll,"False" '''all items deselected function
							wait Wait3
							
						    .validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId,"False"
							wait Wait3
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderId1,"False"
							wait Wait3
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							strProviderId=testcasedata.getvalue("strProviderId")
							
							.selectListItem MULTI_LIST_PROVIDER,strProviderIdAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROVIDER,strProviderId,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderIdAll,"False" 	
							
							.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_EndOfCampaign_ValidateProviderIDs", "SCR_NEW_EOC_TC_004"
