'
' File Name						:	GlobalSettings_Edit_GoToRHQUILink_Select
' Description					:	Validate the "Go To RHQ UI" link on Global Settings edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-07-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_GoToRHQUILink_Select", "ADMN_GS_TC_04"

'Validating the default page tabs.
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait Wait5
With ivm.page(GlobalSettings_page)
	
	.webLink("EditSettings").press
	.webLink("GoToRHQUI").press
End With

rhq.clickCertificate
	
rhq.assertExist "True"
wait 15
rhq.Close
wait 10
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_GoToRHQUILink_Select", "ADMN_GS_TC_04"
