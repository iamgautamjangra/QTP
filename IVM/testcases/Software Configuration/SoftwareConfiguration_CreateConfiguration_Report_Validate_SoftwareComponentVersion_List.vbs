'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponentVersion_List
' Description					:	Validate the Software Component Version List for validation of imported report services.
' Author 						:   Fonantrix Solution
' Date 							:   18-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait20

With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Software Configuration" page.    
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait30
End with

With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Create Configuration" page.
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
	
        .webList("SoftwareComponent").assertExist "True"
        .webList("SoftwareComponent").assertStatus "Visible"
		
			
		.webList("Display_version").selectItem "Latest version"
		
		 .webLink("Cancel").press 
         wait wait10
		
	End with


'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"