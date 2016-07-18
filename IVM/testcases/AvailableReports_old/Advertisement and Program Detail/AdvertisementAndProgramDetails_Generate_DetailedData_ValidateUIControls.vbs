'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls
' Description					:	Validate the UI controls of Detailed Data tab.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls", "REP_APD_TC_038"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
strSites=testcasedata.getvalue("strSites")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
					     wait 5
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
						.webTable("SelectaDatasetforThisReport").assertStatus "Visible"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Report Name","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "Dataset Creation","True"
						.webTable("SelectaDatasetforThisReport").assertColumnExist "User","True"
                        .webTable("SelectaDatasetforThisReport").assertColumnExist "Parameters","True"
											
										 
						.webTable("SelectaDatasetforThisReport").presstblRadioBtn strSeachValue,1 
							wait 5 
						 
				       .webLink("FilterOptions").assertExist "True"
				       .webLink("FilterOptions").assertStatus "Visible"
			     	   .webLink("FilterOptions").press
					    wait 5
					     
					     .selectDate reportAdvertisementAndProgramDetails,"StartDate",strStart

						.selectDate reportAdvertisementAndProgramDetails,"EndDate",strEnd
						
						.selectListItem MULTI_LIST_SITES,strSites,"True"
						wait 3												
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 3
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 3
												
						.webEdit("Comments").setValue strComments
						
						.webbutton("Generate").press 
						wait 8
						
End with	

With ivm.page(reportgen_page)	

						.webLink("DetailedData").press
						wait 5
						
						.webTable("DetailedData_APD").assertExist "True"
						
						.webEdit("Search").assertExist "True"
						.webEdit("Search").assertStatus "Visible"
						
						.webLink("AdvancedSearch").assertExist "True"
						.webLink("AdvancedSearch").assertStatus "Visible"
						
						.webTable("DetailedData_AS").assertExist "True"
						.webTable("DetailedData_AS").assertStatus "Visible"
						
						.webTable("DetailedData_AS").assertColumnExist "Time Range", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Element Number", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Campaign Name", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Clock Number", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Unique Customers", "True"
						
						
						.webTable("DetailedData_AS").assertColumnExist "Program PID", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program PAID", "True"
					
						.webTable("DetailedData_AS").assertColumnExist "Channel", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Title", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Episode Title", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Series Title", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Episode ID", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Placements", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Program Partial Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Ad Title", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Placements", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Full Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Partial Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Fast Forward Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Placements Not Viewed", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Total Home Views", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Advert Average Play Time", "True"
						
						.webTable("DetailedData_AS").assertColumnExist "Total Ad Views", "True"
						
						.webLink("BackToPreviousPage").press
						wait 10
End with

with ivm.page(report_page)
					
						.webButton("Cancel").press
						wait 5
End with

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_ValidateUIControls", "REP_APD_TC_038"