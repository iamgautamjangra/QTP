'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	AdvertisementSummary_Generate_PreferredData_ValidateUIControls 
' Description					:	Validate the UIControls on preffered data page.
' Author 						:   SeaChange
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateUIControls", "REP_ASR_TC_020"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
REM strGrouping=testcasedata.getvalue("strGrouping")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						 .webTable("AvailableReports").presstblLink reportAdvertisementSummary,3
						  wait 10 
						  
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5
							
							
						 .webLink("FilterOptions").assertExist "True"
						 .webLink("FilterOptions").assertStatus "Visible"
						 REM .webLink("FilterOptions").press
						REM wait 5
						   
					     .selectDate reportAdvertisementSummary,"StartDate",START_DATE

						 .selectDate reportAdvertisementSummary,"EndDate",END_DATE
						
						 REM .selectListItem MULTI_LIST_SITES,strSites,"True"
						 REM wait 3												
						 .selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						 wait 3
						 .selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						 wait 3
						 REM .webList("Grouping").selectItem strGrouping
						 REM wait 3
						
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						 wait 8
						
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							 wait 5

							.webTable("PreferredData_AS").assertExist "True"
							
							.webEdit("SearchTerm").assertExist "True"
							.webEdit("SearchTerm").assertStatus "Visible"
							
							.webLink("AdvancedSearch").assertExist "True"
							.webLink("AdvancedSearch").assertStatus "Visible"
							
							.webTable("PreferredData_AS").assertExist "True"
							.webTable("PreferredData_AS").assertStatus "Visible"
							
							.webTable("PreferredDataHeader_AS").assertColumnExist "Time Range", "True"
													
						    .webTable("PreferredDataHeader_AS").assertColumnExist "Element Number", "True"
							
							.webTable("PreferredDataHeader_AS").assertColumnExist "Clock Number", "True"
							
							.webTable("PreferredDataHeader_AS").assertColumnExist "Program Provider", "True"
							
							.webTable("PreferredDataHeader_AS").assertColumnExist "Ad Break", "True"
							
							.webTable("PreferredDataHeader_AS").assertColumnExist "Ad Slot Position", "True"
																			
							.webTable("PreferredDataHeader_AS").assertColumnExist "Total Ad Views", "True"
							
							
							.webLink("BackToPreviousPage").press
							wait 10
							
End with	

with ivm.page(report_page)

							.webButton("Cancel").press

End with
			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementSummary_Generate_PreferredData_ValidateUIControls", "REP_ASR_TC_020"