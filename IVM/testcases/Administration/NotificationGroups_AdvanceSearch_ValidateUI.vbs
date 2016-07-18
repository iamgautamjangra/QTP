'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_AdvanceSearch_ValidateUI
' Description					:	Validate UI Controls of Advance Search Popup Window 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_ValidateUI", "ALC_NGP_TC_8"

  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
  ivm.page(Common_page).webLink("AdvancedSearch").press
  wait 3
  
  ivm.page(Common_page).webElement("AdvSearchTerm").assertExist "True"
  ivm.page(Common_page).webElement("AdvSearchTerm").assertStatus "Visible"
  ivm.page(Common_page).webEdit("AdvSearchTerm").assertExist "True"
  ivm.page(Common_page).webEdit("AdvSearchTerm").assertStatus "Visible"

  ivm.page(Common_page).webElement("SearchName").assertExist "True"
  ivm.page(Common_page).webElement("SearchName").assertStatus "Visible"
  ivm.page(Common_page).webEdit("SearchName").assertExist "True"
  ivm.page(Common_page).webEdit("SearchName").assertStatus "Visible"

  ivm.page(Common_page).webElement("SearchDescription").assertExist "True"
  ivm.page(Common_page).webElement("SearchDescription").assertStatus "Visible"
  ivm.page(Common_page).webEdit("SearchDescription").assertExist "True"
  ivm.page(Common_page).webEdit("SearchDescription").assertStatus "Visible"
  
  ivm.page(Common_page).webElement("SearchDateCreated").assertExist "True"
  ivm.page(Common_page).webElement("SearchDateCreated").assertStatus "Visible"
  ivm.page(Common_page).webEdit("SearchDateCreated").assertExist "True"
  ivm.page(Common_page).webEdit("SearchDateCreated").assertStatus "Visible"
  
  ivm.page(Common_page).webLink("AdvSearch").assertExist "True"
  ivm.page(Common_page).webLink("AdvSearch").assertStatus "Visible"
  
  ivm.page(Common_page).webLink("SearchCancel").assertExist "True"
  ivm.page(Common_page).webLink("SearchCancel").assertStatus "Visible"

  ivm.page(Common_page).webLink("SearchClearAll").assertExist "True"
  ivm.page(Common_page).webLink("SearchClearAll").assertStatus "Visible"
  
  ivm.page(Common_page).webLink("SearchCancel").press
  wait 3

  ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
  ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
  
 
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_ValidateUI", "ALC_NGP_TC_8"