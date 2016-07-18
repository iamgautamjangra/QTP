'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponentVersion_List
' Description					:   Validate the Software Component Version List for validation of imported Job Manager services.
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"


ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
        wait wait40		

With ivm.page(SoftwareConfiguration_page)
	
       .webLink("CreateConfiguration").press 
        wait wait30		
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
		
	    REM .webList("Display_version").selectItem "Latest version"
		
		 REM .webLink("Cancel").press 
         REM wait wait10
		

End with
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponentVersion_List", "SOF_CONF_TC_001"

