'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_Import_Component_and_Service_XML_ValidateUIControls
' Description					:	Validate the Software Component Version List for validation of imported report services.
' Author 						:   Fonantrix Solution
' Date 							:   18-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a
executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Import_Component_and_Service_XML_ValidateUIControls", "SOF_CONF_TC_003"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
		
wait wait30

With ivm.page(SoftwareConfiguration_page)
		    
		.webElement("SeaChangeAtriaConfiguration").assertExist "True"
		.webElement("SeaChangeAtriaConfiguration").assertStatus "Visible"
		
		.webElement("Add").assertExist "True"
		.webElement("Add").assertStatus "Visible"
		
		.webLink("Server").assertExist "True"
		.webLink("Server").assertStatus "Visible"
		
		.webElement("ServiceImport").assertExist "True"
		.webElement("ServiceImport").assertStatus "Visible"
		
		.webLink("Values").assertExist "True"
		.webLink("Values").assertStatus "Visible"
		
		.webLink("Schema").assertExist "True"
		.webLink("Schema").assertStatus "Visible"
		
		.webLink("SeaChange").assertExist "True"
		.webLink("SeaChange").assertStatus "Visible"
		
		.webLink("Schema").press
		
		wait wait20
		
        .webElement("ImportServiceConfiguration").assertExist "True"
		.webElement("ImportServiceConfiguration").assertStatus "Visible"
		
		.webElement("EnterInTheFieldBelow").assertExist "True"
		.webElement("EnterInTheFieldBelow").assertStatus "Visible"	
		
		.webLink("HomePage").assertExist "True"
		.webLink("HomePage").assertStatus "Visible"
		
		.webLink("Import").assertExist "True"
		.webLink("Import").assertStatus "Visible"
		
		.webLink("Cancel1").assertExist "True"
		.webLink("Cancel1").assertStatus "Visible"
		
End With		
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Import_Component_and_Service_XML_ValidateUIControls", "SOF_CONF_TC_003"