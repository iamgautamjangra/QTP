'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_EditLink_Cancel
' Description					:	Validate the functionality Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_EditLink_Cancel", "ALC_NGP_TC_15"

strName = testcasedata.getvalue("strName")
strNameEdit = testcasedata.getvalue("strNameEdit")
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
    ivm.page(Common_page).webTable("NotificationGroups").pressLink strName,"Edit",4	

  
    ivm.page(Common_page).webElement("NotificationGroupdetails").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroupdetails").assertStatus "Visible"

    ivm.page(Common_page).webEdit("Name").setValue strNameEdit

    ivm.page(Common_page).webLink("Cancel").press
	wait 3

    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	
	 ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
	  ivm.page(Common_page).webTable("NotificationGroups").assertDelValue strNameEdit


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_EditLink_Cancel", "ALC_NGP_TC_15"