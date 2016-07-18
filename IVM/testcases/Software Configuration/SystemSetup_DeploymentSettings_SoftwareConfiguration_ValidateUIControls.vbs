'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls
' Description					:	Validate the UI controls of "Software Configuration" page.
' Author 						:   Fonantrix Solution
' Date 							:   17-12-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls", "SOF_CONF_TC_001"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
wait wait40
With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Software Configuration" page.    
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"

		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"


		.webTable("ConfigurationName").assertExist "True"

		.assertExistLink "Unassigned"
		.assertExistLink "SeaChange"

		.webLink("Actions").assertExist "True"
		.webLink("Actions").assertStatus "Visible"
		.webLink("Actions").press
		wait wait5
		.webLink("ImportConfiguration").assertExist "True"
		.webLink("ImportConfiguration").assertStatus "Visible"

		.webLink("Monitor").assertExist "True"
		.webLink("Monitor").assertStatus "Visible"
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls", "SOF_CONF_TC_001"