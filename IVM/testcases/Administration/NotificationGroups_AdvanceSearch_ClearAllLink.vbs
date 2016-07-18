'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_AdvanceSearch_ClearAllLink
' Description					:	Validate the "Clear All" Link functionality of "Advance Search" 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_ClearAllLink", "ALC_NGP_TC_12"

  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
    strSearchDateCreated = testcasedata.getvalue("SearchDateCreated")
    strSearchTerm = testcasedata.getvalue("AdvSearchTerm")
	strSearchName = testcasedata.getvalue("SearchName")
	strSearchDescription = testcasedata.getvalue("SearchDescription")
     
    ivm.page(Common_page).webLink("AdvancedSearch").press
    wait 3

    ivm.page(Common_page).webEdit("SearchDescription").setValue strSearchDescription
    ivm.page(Common_page).webEdit("SearchTerm").setValue strSearchTerm
	ivm.page(Common_page).webEdit("SearchName").setValue strSearchName
	ivm.page(Common_page).selectdate "DataCreated" ,strSearchDateCreated
	
    ivm.page(Common_page).webLink("AdvClearAll").press
	
	  ivm.page(Common_page).webLink("AdvClearAll").press
    wait 3
	
	ivm.page(Common_page).webEdit("SearchDateCreated").assertValue ""
    ivm.page(Common_page).webEdit("SearchTerm").assertValue "Search..."
	ivm.page(Common_page).webEdit("SearchName").assertValue ""
	ivm.page(Common_page).webEdit("SearchDescription").assertValue ""
	
    ivm.page(Common_page).webLink("AdvCancel").press
    wait 3
	    ivm.page(Common_page).webLink("AdvCancel").press
		wait 3
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_ClearAllLink", "ALC_NGP_TC_12"