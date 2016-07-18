'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle
' Description					:	Validate the element number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_APD_TC_028"


strSeachValue=testcasedata.getvalue("strSeachValue")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
ProgramTitle=testcasedata.getvalue("ProgramTitle")
ProgramTitleInv=testcasedata.getvalue("ProgramTitleInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementAndProgramDetails,3
						 wait 10	
						 
						.webTable("SelectaDatasetforThisReport").assertExist "True"
												 
						.webTable("DataSet").presstblRadioBtn strSeachValue,1 
							wait 5 
							
						.webElement("FilterOptions").assertExist "True"
						.webElement("FilterOptions").assertStatus "Visible"
					
					
						
                     							
						
						
						.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
						wait 5
						
						.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
						wait 5
						
										
						.webEdit("Comments").setValue strComments
						wait 5
						
						.webButton("Generate").press
						wait 8
						
End with	

With ivm.page(DetailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
							.webTable("DetailedData").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramTitle").setValue ProgramTitle
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria").assertExist "True" 
							.webTable("SearchCriteria").assertStatus "Visible"
							
							.weLink("ProgramTitle").assertExist "True"
							
							.webTable("DetailedData").assertExist "True"
							
							.webTable("DetailedData").assertTblValue SearchVal,Col,ProgramTitle 
							wait 5	
'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ProgramTitle").setValue ProgramTitleInv
						    wait 5
							.webLink("AdvSearch").press
							wait 5	
							
							.webTable("SearchCriteria").assertExist "True" 
							.webTable("SearchCriteria").assertStatus "Visible"
							
							.weLink("ProgramTitle").assertExist "True"
							
							.webTable("DetailedData").assertExist "True"
						
							.webTable("DetailedData").SearchData "No data exists for the selected criteria."
							wait 5
							
					        .webLink("BackToPreviousPage").press
			                wait 10
End with

with ivm.page(report_page)
					
							.webButton("Cancel").press
							wait 5
End with					
DetailedData_AS					
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateProgramTitle", "REP_APD_TC_028"