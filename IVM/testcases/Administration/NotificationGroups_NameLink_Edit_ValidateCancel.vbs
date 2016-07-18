'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_Edit_ValidateCancel
' Description					:	Validate the functionality Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateCancel", "ALC_NGP_TC_16"
 ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strName = testcasedata.getvalue("Name")
strNameEdit = testcasedata.getvalue("NameEdit")
strDescription = testcasedata.getvalue("strDescription")
strDescriptionEdit = testcasedata.getvalue("strDescriptionEdit")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
    ivm.page(Common_page).webTable("NotificationGroups").pressTblLink strName,1
wait 3

  ivm.page(Common_page).webLink("Actions").press
     wait 2
    ivm.page(Common_page).webLink("Edit").press	
    wait Wait5

    ivm.page(Common_page).webElement("NotificationGroupdetails").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroupdetails").assertStatus "Visible"

    ivm.page(Common_page).webEdit("Name").setValue strNameEdit
    
    ivm.page(Common_page).webEdit("Description").setValue strDescriptionEdit
    ivm.page(Common_page).webLink("Cancel").press
    wait Wait5

    ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
     ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"

     ivm.page(Common_page).webElement("NotificationGroupDetails").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroupDetails").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("NotificationGroupDetails").assertText "Notification Group Details"
	 
	 ivm.page(Common_page).webElement("NotificationGroupName").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroupName").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("NotificationGroupName").assertText strName & " Details"

     ivm.page(Common_page).webElement("Name").assertExist "True"
     ivm.page(Common_page).webElement("Name").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("Name_Value").assertExist "True"
     ivm.page(Common_page).webElement("Name_Value").assertStatus "Visible"
     ivm.page(Common_page).webElement("Name_Value").assertText strName
	 
	 ivm.page(Common_page).webElement("Description").assertExist "True"
	 ivm.page(Common_page).webElement("Description").assertStatus "Visible"
	 
	  ivm.page(Common_page).webElement("Description_Value").assertExist "True"
	 ivm.page(Common_page).webElement("Description_Value").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("Description_Value").assertText strDescription

     ivm.page(Common_page).webElement("Emailrecipients").assertExist "True"
     ivm.page(Common_page).webElement("Emailrecipients").assertStatus "Visible"

	
	
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateCancel", "ALC_NGP_TC_16"