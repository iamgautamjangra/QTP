'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls
' Description					:	Validate the UI controls of "Software Configuration" page.
' Author 						:   Fonantrix Solution
' Date 							:   18-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls", "SOF_CONF_TC_002"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait40
With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Software Configuration" page.    
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"

		.webElement("SoftwareConfigurationsLocation").assertExist "True"
		.webElement("SoftwareConfigurationsLocation").assertStatus "Visible"

		.webTable("ConfigurationName").assertExist "True"

		.assertExistLink "Unassigned"
		.assertExistLink "SeaChange"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait10		
End with

With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Create Configuration" page.
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
		
		.webElement("SoftwareConfigurationName").assertExist "True"
		.webElement("SoftwareConfigurationName").assertStatus "Visible"
		
		.webElement("SoftwareComponent").assertExist "True"
		.webElement("SoftwareComponent").assertStatus "Visible"
		
		.webElement("SoftwareComponentVersion").assertExist "True"
		.webElement("SoftwareComponentVersion").assertStatus "Visible"
		
		.webElement("Sub-component").assertExist "True"
		.webElement("Sub-component").assertStatus "Visible"
		
		.webCheckBox("Chbx_subs_all").assertExist "True"
		.webCheckBox("Chbx_subs_all").assertStatus "Visible"
		
		.webCheckBox("Services0").assertExist "True"
		.webCheckBox("Services0").assertStatus "Visible"
		
		.webTable("Sub-Component").assertExist "True"
		
		.webElement("Version").assertExist "True"
		.webElement("Version").assertStatus "Visible"

        .webElement("Unassigned").assertExist "True"
		.webElement("Unassigned").assertStatus "Visible"
		
        .webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"

End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SystemSetup_DeploymentSettings_SoftwareConfiguration_ValidateUIControls", "SOF_CONF_TC_002"