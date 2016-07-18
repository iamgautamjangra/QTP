'
' File Name						:	GlobalSettings_GlobalSettingspage_Select_GoToRHQUILink
' Description					:	Validate the "Go To RHQ UI" link on Global Settings page
' Author 						:   Fonantrix Solution
' Date 							:   20-07-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_GlobalSettingspage_Select_GoToRHQUILink", "ADMN_GS_TC_02"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait 8
'Validating the default page tabs.
With ivm.page(GlobalSettings_page)
	
	.webLink("GoToRHQUI").press
	wait wait5
End With

rhq.clickCertificate

rhq.assertExist "True"
wait 15
rhq.Close
wait 10
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_GlobalSettingspage_Select_GoToRHQUILink", "ADMN_GS_TC_02"
