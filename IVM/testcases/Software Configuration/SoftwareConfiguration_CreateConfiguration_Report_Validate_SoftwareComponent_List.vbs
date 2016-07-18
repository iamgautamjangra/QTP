'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponent_List
' Description					:	Validate the Software Component List for validation of imported report services.
' Author 						:   Fonantrix Solution
' Date 							:   18-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION


With ivm.page(SoftwareConfiguration_page)
		'Validate the UI controls of "Software Configuration" page.    
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait10		
End with

With ivm.page(CreateConfiguration_page)
		'Validate the UI controls of "Create Configuration" page.
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
	
        .webList("SoftwareComponent").assertExist "True"
        .webList("SoftwareComponent").assertStatus "Visible"
		
        REM .webList("SoftwareComponent").selectAllListItem listname,strOperation
	
         REM selectAllListItem(listname,strOperation)

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"