'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponent_List
' Description					:   Import the service XML of Job Manager components
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"


ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
        wait wait40	

With ivm.page(SoftwareConfiguration_page)
	
       .webLink("CreateConfiguration").press 
        wait wait30	

End with
With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
			
End with
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_JobManager_Validate_SoftwareComponent_List", "SOF_CONF_TC_001"

