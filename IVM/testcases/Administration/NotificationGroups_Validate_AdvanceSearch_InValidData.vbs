'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_Validate_AdvanceSearch_InValidData
' Description					:	Validate "Advance Search" with Invalid Data 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_Validate_AdvanceSearch_InValidData", "ALC_NGP_TC_10"

'variable declare

    strSearchDateCreatedBlank = testcasedata.getvalue("SearchDateCreatedBlank") 
    strAdvSearchTermBlank = testcasedata.getvalue("AdvSearchTermBlank")
	strSearchNameBlank = testcasedata.getvalue("SearchNameBlank")
	strSearchDescriptionBlank = testcasedata.getvalue("SearchDescriptionBlank")
    strSearchDateCreatedInvalid = testcasedata.getvalue("SearchDateCreatedInvalid") 
    strSearchTermInvalid = testcasedata.getvalue("SearchTermInvalid")
	strSearchNameInvalid = testcasedata.getvalue("SearchNameInvalid")
	strSearchDescriptionInvalid = testcasedata.getvalue("SearchDescriptionInvalid")



	ivm.page(Common_page).webLink("AdvancedSearch").press
	wait 3

    ivm.page(Common_page).webEdit("SearchDateCreated").setValue strSearchDateCreatedBlank
    ivm.page(Common_page).webEdit("AdvSearchTerm").setValue strSearchTermBlank
	ivm.page(Common_page).webEdit("SearchName").setValue strSearchNameBlank
	ivm.page(Common_page).webEdit("SearchDescription").setValue strSearchDescriptionBlank
	
    ivm.page(Common_page).webLink("AdvSearch").press
    wait 3

    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	
	
	ivm.page(Common_page).webLink("AdvancedSearch").press
	wait 3

    ivm.page(Common_page).webEdit("SearchDateCreated").setValue strSearchDateCreatedInvalid
    ivm.page(Common_page).webEdit("AdvSearchTerm").setValue strSearchTermInvalid
	ivm.page(Common_page).webEdit("SearchName").setValue strSearchNameInvalid
	ivm.page(Common_page).webEdit("SearchDescription").setValue strSearchDescriptionInvalid
	
    ivm.page(Common_page).webLink("AdvSearch").press
    wait 3
 
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	
    ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
    ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
 
 
    ivm.page(Common_page).webLink("SearchClearAll").assertExist "True"
    ivm.page(Common_page).webLink("SearchClearAll").assertStatus "Visible"
 
    ivm.page(Common_page).webLink("SearchClearAll").press
    wait Wait5
 
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_Validate_AdvanceSearch_InValidData", "ALC_NGP_TC_10"