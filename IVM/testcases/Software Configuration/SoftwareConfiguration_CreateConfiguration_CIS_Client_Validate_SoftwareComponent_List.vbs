'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_CIS_Client_Validate_SoftwareComponent_List
' Description					:   Import CIS client component and service XML
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_CIS_Client_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"



ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
		wait wait40	

With ivm.page(SoftwareConfiguration_page)
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait20
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"

		.webList("ComponentId").selectItem "Job Manager"
	    .webLink("Cancel").press 

		wait wait20
		
End with


'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_CIS_Client_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"

