'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_Report_Cancel
' Description					:   Validate the Edit Configuration "Cancel"  button.
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_Report_Cancel", "SOF_CONF_TC_015"


strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

		           wait wait40	
				   
With ivm.page(SoftwareConfiguration_page)

        .clickLink strSoftwareConfName1
          wait wait20	
 
        .webLink("Actions").press 
        wait wait20

		.webLink("Edit").press 
		wait wait20	
End with

With ivm.page(SoftwareConfiguration_page)
		
	    .webLink("Cancel_2").press 
        
		.webElement("GeneralSoftwConfSettings").assertExist "True"
		.webElement("GeneralSoftwConfSettings").assertStatus "Visible"
		
		ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

	          wait wait20	
     
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_Report_Cancel", "SOF_CONF_TC_015"

