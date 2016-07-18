'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_CreateNotificationGroup_ValidateUI
' Description					:	Validate UI Controls of Create Notification Group Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_ValidateUI", "ALC_NGP_TC_3"

'Variable Declaration
 
ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS

wait Wait5

UserName=testcasedata.getvalue("UserName")
User=testcasedata.getvalue("User")


    ivm.page(Common_page).webLink("CreateNotificationGroup").press
	wait 3
	
    ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
	ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"

    ivm.page(Common_page).webElement("CreateNotificationGroup").assertExist "True"
	ivm.page(Common_page).webElement("CreateNotificationGroup").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("NotificationGroupdetails").assertExist "True"
	ivm.page(Common_page).webElement("NotificationGroupdetails").assertStatus "Visible"
	
	
	ivm.page(Common_page).webElement("Name").assertExist "True"	
	ivm.page(Common_page).webElement("Name").assertStatus "Visible"
	
	ivm.page(Common_page).webEdit("Name").assertExist "True"
	ivm.page(Common_page).webEdit("Name").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("Description").assertExist "True"
	ivm.page(Common_page).webElement("Description").assertStatus "Visible"
	
	ivm.page(Common_page).webEdit("Description").assertExist "True"
	ivm.page(Common_page).webEdit("Description").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("Emailrecipients").assertExist "True"
	ivm.page(Common_page).webElement("Emailrecipients").assertStatus "Visible"
	
	ivm.page(Common_page).webLink("AddRecipient").assertExist "True"
	ivm.page(Common_page).webLink("AddRecipient").assertStatus "Visible"
	
	ivm.page(Common_page).webLink("CreateNotificationgroup").assertExist "True"
	ivm.page(Common_page).webLink("CreateNotificationgroup").assertStatus "Visible"
	
	
	ivm.page(Common_page).webLink("Cancel").assertExist "True"
	ivm.page(Common_page).webLink("Cancel").assertStatus "Visible"
	
	ivm.page(Common_page).webLink("AddRecipient").press
	wait 3
	
    ivm.page(Common_page).webList("EmailType").assertSelectedItem UserName
	wait 3
    ivm.page(Common_page).webList("User").assertSelectedItem User
    wait 3

	ivm.page(Common_page).webLink("Cancel").press
	wait 3
	
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_ValidateUI", "ALC_NGP_TC_3"