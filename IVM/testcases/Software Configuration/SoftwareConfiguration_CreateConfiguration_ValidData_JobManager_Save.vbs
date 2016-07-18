'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_ValidData_JobManager_Save
' Description					:   Validate Job manager configuration should be created successfully
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_ValidData_JobManager_Save", "SOF_CONF_TC_001"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
		wait wait40

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
		
		wait wait30
		
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
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_ValidData_JobManager_Save", "SOF_CONF_TC_001"

