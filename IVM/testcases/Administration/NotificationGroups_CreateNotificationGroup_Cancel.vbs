'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_CreateNotificationGroup_Cancel
' Description					:	Validate Functionality of Create Notification Group Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a
executionController.startTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_Cancel", "ALC_NGP_TC_6"

'Variable Declaration
ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5

strName = testcasedata.getvalue("Name")
strDescription = testcasedata.getvalue("Description")
strUserName = testcasedata.getvalue("UserName")
strUser = testcasedata.getvalue("User")


     ivm.page(Common_page).webLink("CreateNotificationGroup").press
	 wait Wait5

     ivm.page(Common_page).webElement("CreateNotificationGroup").assertExist "True"
     ivm.page(Common_page).webElement("CreateNotificationGroup").assertStatus "Visible"
     
	 ivm.page(Common_page).webEdit("Name").setValue strName
     ivm.page(Common_page).webEdit("Description").setValue strDescription
     
	 ivm.page(Common_page).webLink("AddRecipient").press
	 wait 3
	 
     ivm.page(Common_page).webList("EmailType").selectItem strUserName
     ivm.page(Common_page).webList("User").selectItem strUser

	 ivm.page(Common_page).webLink("Cancel").press
	 
	 ivm.page(Common_page).webLink("Cancel").press
	 wait Wait5
	 
     ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
	 ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	 ivm.page(Common_page).webTable("NotificationGroups").assertDelValue strDescription
	 ivm.page(Common_page).webTable("NotificationGroups").assertDelValue strName


'End Test Case	
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_Cancel", "ALC_NGP_TC_6"