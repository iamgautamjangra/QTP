'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponentVersion_List
' Description					:   Validate the Software Component Version List for validation of imported DGW services.
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
        wait wait20

With ivm.page(SoftwareConfiguration_page)
		
        .webLink("CreateConfiguration").press 
        wait wait20
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"

		.webList("Display_version").selectItem "Latest version"
        .webLink("Cancel").press 
        
		 wait wait20
End with
		


'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"

