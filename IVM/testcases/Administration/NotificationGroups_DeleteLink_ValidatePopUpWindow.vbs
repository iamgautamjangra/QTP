'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_DeleteLink_ValidatePopUpWindow
' Description					:	Validate UI Controls of Delete Popup Window
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_DeleteLink_ValidatePopUpWindow", "ALC_NGP_TC_17"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strName = testcasedata.getvalue("Name")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
    ivm.page(Common_page).webTable("NotificationGroups").pressLink strName,"Delete",4
	wait 3
	
	

	ivm.page(Common_page).webLink("DlDelete").assertExist "True"
    ivm.page(Common_page).webLink("DlDelete").assertStatus "Visible"

    ivm.page(Common_page).webLink("DlDelete").assertExist "True"
    ivm.page(Common_page).webLink("DlDelete").assertStatus "Visible"

    ivm.page(Common_page).webLink("DlCancel").assertExist "True"
    ivm.page(Common_page).webLink("DlCancel").assertStatus "Visible"
	
	 ivm.page(Common_page).webElement("DeleteMsg").assertExist "True"
	 
	 ivm.page(Common_page).webElement("DeleteMsg").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("DeleteMsg").assertText NotificationDelete_msg & strName & "?"

    ivm.page(Common_page).webLink("DlCancel").press
    wait 3
	
	
	
	
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_DeleteLink_ValidatePopUpWindow", "ALC_NGP_TC_17"