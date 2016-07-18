'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	UniqueCustomers_ValidateProviderIDs
' Description					:	Validate the Provider ID multiselect list box.
' Author 						:   Fonantrix Solution
' Date 							:   05-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "UniqueCustomers_ValidateProviderIDs", "REP_UCR_TC_015"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
if status=False Then
Browser("SeaChangeManagementConsole").Refresh
end if
strSeachValue=testcasedata.getvalue("strSeachValue")
strProviderId=testcasedata.getvalue("strProviderId")
strProviderId1=testcasedata.getvalue("strProviderId1")
strProviderIdAll=testcasedata.getvalue("strProviderIdAll")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10
DataSet=DATASET_UNIQUECUSTOMERS
With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportUniqueCustomers,3
							 wait Wait10	
							 
							.webLink("AdvancedSearch").press
							wait Wait3
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait Wait3
							status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
							if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
							wait wait8
							.webLink("AdvancedSearch").press
							wait Wait8
							.webEdit("DatasetName").setValue DataSet
							.webLink("AdvSearch").press
							wait wait8
							end if
							.webTable("DataSet").presstblRadioBtn DataSet,1
	
							wait Wait10
							 
							.webElement("FilterOptions").assertExist "True"
						    .webElement("FilterOptions").assertStatus "Visible"
													
							.webEdit("ProviderIDs").assertExist "True"
							.webEdit("ProviderIDs").assertStatus "Visible"
							.webEdit("ProviderIDs").assertValue "Type to search..."
							
													
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True" '''all items selected function
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"True"
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId,"False"
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderId1,"False"
							
							strProviderIdAll=testcasedata.getvalue("strProviderIdAll")
							strProviderId=testcasedata.getvalue("strProviderId")
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_PROVIDERIDS,strProviderIdAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "UniqueCustomers_ValidateProviderIDs", "REP_UCR_TC_015"