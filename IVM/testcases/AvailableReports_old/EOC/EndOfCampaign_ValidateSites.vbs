'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	EndOfCampaign_ValidateSites
' Description					:	Validate "Sites" List box.
' Author 						:   Fonantrix Solution
' Date 							:   29-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "EndOfCampaign_ValidateSites", "REP_EOC_TC_014"

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS	
wait 10

strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strSites1=testcasedata.getvalue("strSites1")
strSitesAll=testcasedata.getvalue("strSitesAll")

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportEndOfCampaign,3
							 wait 10	
							 
						    .webTable("SelectaDatasetforThisReport").assertExist "True"
						    .webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						    .webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                            .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
						
						 					
										 
						    .webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							
							.webLink("FilterOptions").assertExist "True"
						    .webLink("FilterOptions").assertStatus "Visible"
							.webLink("FilterOptions").press
							wait 5
				           
		
																													

'Assert webbutton Cancel

                         				 
						 
							.webEdit("Sites").assertExist "True"
							.webEdit("Sites").assertStatus "Visible"
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
							
							.assertListItems MULTI_LIST_SITES,""
							
							.selectListItem MULTI_LIST_SITES,strSites,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITES,strSites1,"True"
							 wait 5
							
							.validateSelectedListItem MULTI_LIST_SITES,strSites,"True"
							.validateSelectedListItem MULTI_LIST_SITES,strSites1,"True"
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"True" '''all items selected function
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							.selectListItem MULTI_LIST_SITES,strSitesAll,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" '''all items deselected function
							
							strSitesAll=testcasedata.getvalue("strSitesAll")
							strSites=testcasedata.getvalue("strSites")
							
							.selectListItem MULTI_LIST_SITES,strSitesAll,"True"
							 wait 5
							.selectListItem MULTI_LIST_SITES,strSites,"False"
							 wait 5
							.validateSelectedListItem MULTI_LIST_SITES,strSitesAll,"False" 	
							
							.webButton("Cancel").press
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "EndOfCampaign_ValidateSites", "REP_EOC_TC_014"