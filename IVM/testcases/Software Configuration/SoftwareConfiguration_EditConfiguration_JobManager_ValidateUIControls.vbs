'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_JobManager_ValidateUIControls
' Description					:   Edit configuration for Reports
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_JobManager_ValidateUIControls", "SOF_CONF_TC_001"

strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
          wait wait10	

With ivm.page(SoftwareConfiguration_page)

         .clickLink strSoftwareConfName1
          wait wait10	

         .webLink("Actions").press 

		.webLink("Edit").assertExist "True"
		.webLink("Edit").assertStatus "Visible"
		
		.webLink("Delete").assertExist "True"
		.webLink("Delete").assertStatus "Visible"
		
		.webLink("Monitor").assertExist "True"
		.webLink("Monitor").assertStatus "Visible"
		
		.webLink("ImportConfiguration").assertExist "True"
		.webLink("ImportConfiguration").assertStatus "Visible"
		
		.webLink("ExportConfiguration").assertExist "True"
		.webLink("ExportConfiguration").assertStatus "Visible"
		
	    .webLink("Edit").press 

		wait wait20	
End with

With ivm.page(SoftwareConfiguration_page)
		
        REM .webElement("VersionAtTop").assertText StrVersionAtTop
		
		.webElement("SoftwareConfigurationSettings").assertExist "True"
		.webElement("SoftwareConfigurationSettings").assertStatus "Visible"
		
		.webElement("SoftwareConfigurationName").assertExist "True"
		.webElement("SoftwareConfigurationName").assertStatus "Visible"
		
		.webEdit("SoftwareConfig_name").assertExist "True"
		.webEdit("SoftwareConfig_name").assertStatus "Visible"
		
		.webElement("SoftwareConfDiscription").assertExist "True"
		.webElement("SoftwareConfDiscription").assertStatus "Visible"
		
		.webEdit("Config_description").assertExist "True"
		.webEdit("Config_description").assertStatus "Visible"
		
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
	
		
		.webElement("AuditLogComments").assertExist "True"
		.webElement("AuditLogComments").assertStatus "Visible"
       
        .webElement("Comments").assertExist "True"
		.webElement("Comments").assertStatus "Visible"
		
		.webEdit("Comments").assertExist "True"
		.webEdit("Comments").assertStatus "Visible"
		
	ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

	          wait wait20	
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_JobManager_ValidateUIControls", "SOF_CONF_TC_001"

