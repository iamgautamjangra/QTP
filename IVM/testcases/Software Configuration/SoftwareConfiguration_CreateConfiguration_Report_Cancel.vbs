'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_Report_Cancel
' Description					:   Validate the Create Configuration "Cancel" button.
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Cancel", "SOF_CONF_TC_012"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
StrSelectedVersion=testcasedata.getvalue("StrSelectedVersion")
StrSoftwareComponent=testcasedata.getvalue("StrSoftwareComponent")



ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
		wait wait30	

With ivm.page(SoftwareConfiguration_page)
	
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait40	
End with

With ivm.page(SoftwareConfiguration_page)
		
	    .webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		.webList("ComponentId").selectItem StrSoftwareComponent
		wait wait5
		REM .webList("Display_version").selectItem StrSelectedVersion
		
		.webLink("Cancel").press
		
		wait wait40
		
End with
With ivm.page(SoftwareConfiguration_page)
		
	    .webElement("SoftwareConfigurationSettings").assertExist "True"
		ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

	          wait wait20	
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_Report_Cancel", "SOF_CONF_TC_012"

