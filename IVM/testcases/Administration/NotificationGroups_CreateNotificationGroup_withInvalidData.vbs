'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_CreateNotificationGroup_withInvalidData
' Description					:	Validate Functionality of Create Notification Group Page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_withInvalidData", "ALC_NGP_TC_4"

'variable declaration
ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5

strNameBlank = testcasedata.getvalue("Name")
strDescriptionBlank = testcasedata.getvalue("Description")
strUserName = testcasedata.getvalue("UserName")
strUser = testcasedata.getvalue("User")
ErrorMessage = testcasedata.getvalue("ErrorMessage")
strNotificationgroupErrorInfo = testcasedata.getvalue("NotificationgroupErrorInfo")

     ivm.page(Common_page).webLink("CreateNotificationgroup").press
     wait Wait5

     ivm.page(Common_page).webElement("CreateNotificationgroup").assertExist "True"
     ivm.page(Common_page).webElement("CreateNotificationgroup").assertStatus "Visible"


     ivm.page(Common_page).webEdit("Name").setValue strNameBlank
     ivm.page(Common_page).webEdit("Description").setValue strDescriptionBlank
     ivm.page(Common_page).webLink("AddRecipient").press
     wait 3

     ivm.page(Common_page).webList("EmailType").selectItem strUserName
     ivm.page(Common_page).webList("User").selectItem strUser

     ivm.page(Common_page).webLink("CreateNotificationgroup").press
     wait Wait5

     ivm.page(Common_page).webElement("NameError").assertExist "True"
     ivm.page(Common_page).webElement("NameError").assertStatus "Visible"
 
     ivm.page(Common_page).webElement("NotificationgroupErrorInfo").assertExist "True"
     ivm.page(Common_page).webElement("NotificationgroupErrorInfo").assertStatus "Visible"
	 ivm.page(Common_page).webElement("NotificationgroupErrorInfo").assertText ErrorMessage
	 ivm.page(Common_page).webLink("Cancel").press
     wait 3
	
     ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	 
	 

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_CreateNotificationGroup_withInvalidData", "ALC_NGP_TC_4"