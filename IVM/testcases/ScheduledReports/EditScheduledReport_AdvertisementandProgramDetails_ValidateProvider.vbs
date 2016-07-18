'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	EditScheduledReport_AdvertisementandProgramDetails_ValidateProviderIDs
' Description					:	Validate "Provider Ids" List box.
' Author 						:   SeaChange
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
 executionController.startTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_ValidateProviderIDs", "SCR_EDIT_ASR_TC_004"
 
ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait15

SearchVal=testcasedata.getvalue("SearchVal")
strProviderAll=testcasedata.getvalue("strProviderAll")
strProvider=testcasedata.getvalue("strProvider")
strProvider1=testcasedata.getvalue("strProvider1")

 With ivm.page(ScheduledReports_Page)

							.webTable("ScheduledReports").pressLink SearchVal,"Edit Options",6
							 wait Wait10		
							
							.webEdit("Provider").assertExist "True"
							.webEdit("Provider").assertStatus "Visible"
							
							.selectListItem MULTI_LIST_PROVIDER,strProviderAll,"True"
							 wait Wait2
							 
							.selectListItem MULTI_LIST_PROVIDER,strProviderAll,"False"
							 wait Wait2
							
							.validateSelectedListItem MULTI_LIST_PROVIDER,"All","False"
							
							.assertListItems MULTI_LIST_PROVIDER & ";" & reportAdvertisementandProgramDetails,""
							wait Wait5
							.assertListDGWDB MULTI_LIST_PROVIDER & ";"& reportAdvertisementandProgramDetails, ""
					  	 wait Wait5
							
							.selectListItem MULTI_LIST_PROVIDER,strProvider,"True"
							 wait Wait2
							 
							.selectListItem MULTI_LIST_PROVIDER,strProvider1,"True"
							 wait Wait2
							 
							strProvider=testcasedata.getvalue("strProvider")
							strProvider1=testcasedata.getvalue("strProvider1")
							
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProvider,"True"
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProvider1,"True"
							
							
							strProviderAll=testcasedata.getvalue("strProviderAll")
							
							.selectListItem MULTI_LIST_PROVIDER,strProviderAll,"True"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderAll,"True" '''all items selected function
							
							.selectListItem MULTI_LIST_PROVIDER,strProviderAll,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderAll,"False" '''all items deselected function
							
							strProviderAll=testcasedata.getvalue("strProviderAll")
							strProvider=testcasedata.getvalue("strProvider")
							
							.selectListItem MULTI_LIST_PROVIDER,strProviderAll,"True"
							 wait Wait2
							.selectListItem MULTI_LIST_PROVIDER,strProvider,"False"
							 wait Wait2
							.validateSelectedListItem MULTI_LIST_PROVIDER,strProviderAll,"False" 	
							
							.webButton("Cancel").press

End With


'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "EditScheduledReport_AdvertisementandProgramDetails_ValidateProviderIDs", "SCR_EDIT_ASR_TC_004"
