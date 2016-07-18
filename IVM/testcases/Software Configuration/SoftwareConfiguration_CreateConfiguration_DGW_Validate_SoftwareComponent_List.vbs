'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponent_List
' Description					:   Validate the Software Component List for validation of imported DGW service.
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponent_List", "SOF_CONF_TC_018"

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
        wait wait40	

With ivm.page(SoftwareConfiguration_page)
		
		.webLink("CreateConfiguration").press 
        wait wait30	

End with
With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
		
		.webList("Component_id2").selectItem "IVM CIS CLIENT"


        .webLink("Cancel").press 
         wait wait30	
		
		ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

	    wait wait20	
     
End with
	
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_DGW_Validate_SoftwareComponent_List", "SOF_CONF_TC_018"

