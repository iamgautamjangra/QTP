'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_CreateNotificationGroup_Selected_BackToPreviousPage
' Description					:	Validate the "Back To Previous Page" link on the Create Notification Group page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_Selected_BackToPreviousPage", "ALC_NGP_TC_7"

 ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5

    ivm.page(Common_page).webLink("CreateNotificationgroup").press
    wait 3
	
	ivm.page(Common_page).webElement("CreateNotificationGroup").assertExist "True"
	ivm.page(Common_page).webElement("CreateNotificationGroup").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("NotificationGroupdetails").assertExist "True"
	ivm.page(Common_page).webElement("NotificationGroupdetails").assertStatus "Visible"
	
	
	ivm.page(Common_page).webElement("Name").assertExist "True"	
	ivm.page(Common_page).webElement("Name").assertStatus "Visible"
	
	ivm.page(Common_page).webEdit("Name").assertExist "True"
	ivm.page(Common_page).webEdit("Name").assertStatus "Visible"

    ivm.page(Common_page).webLink("BackToPreviousPage").press
    wait Wait5
  
   
   
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
	ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	
	ivm.page(Common_page).webEdit("Name").assertExist "False"
	


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_Selected_BackToPreviousPage", "ALC_NGP_TC_7"