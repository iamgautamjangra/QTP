'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	AlertSettings_NotificationGroups_ValidateUI
' Description					:	Validate the functionality Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "AlertSettings_NotificationGroups_ValidateUI", "ALC_NGP_TC_15"


  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
   with ivm.page(Common_page)
                             .webTable("NotificationGroups").assertExist "True"
							 .webElement("NotificationGroups").assertExist "True"
							 .webElement("NotificationGroups").assertStatus "Visible"
							 .webElement("CreateNotificationGroup").assertExist "True"
							 .webElement("CreateNotificationGroup").assertStatus "Visible"
							 .weblink("AdvancedSearch").assertExist "True"
							 .weblink("AdvancedSearch").assertStatus "Visible"
							 .webEdit("Search").assertExist "True"
							 .webEdit("Search").assertStatus "Visible"
							 .webEdit("Search").assertValue "Search..."
    

  End with
   
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AlertSettings_NotificationGroups_ValidateUI", "ALC_NGP_TC_15"