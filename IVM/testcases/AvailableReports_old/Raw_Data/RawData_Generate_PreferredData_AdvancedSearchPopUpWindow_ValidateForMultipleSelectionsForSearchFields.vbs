'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSearchFields
' Description					:	Validate multiple filters using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   24-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSearchFields", "REP_RDR_TC_035"

START_DATE=REPORT_START_DATE1
END_DATE=REPORT_END_DATE1
strSeachValue=testcasedata.getvalue("strSeachValue")
REM strSites=testcasedata.getvalue("strSites")
REM strSiteGroups=testcasedata.getvalue("strSiteGroups")
REM strGrouping=testcasedata.getvalue("strGrouping")
strProviderId=testcasedata.getvalue("strProviderId")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strDeviceID=testcasedata.getvalue("strDeviceID")
strProgramPID=testcasedata.getvalue("strProgramPID")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait 10
 
with ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 10	
							 
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
							REM .webLink("FilterOptions").press
							REM wait 5
						
							.selectDate reportRawData,"StartDate",START_DATE
							wait 5
							.selectDate reportRawData,"EndDate",END_DATE		
							wait 5
													
							REM .selectListItem MULTI_LIST_SITES,strSites,"True"
							REM wait 5
							
							REM .selectListItem MULTI_LIST_SITEGROUPS,strSiteGroups,"True"
							REM wait 5
							
							.selectListItem MULTI_LIST_PROVIDERIDS,strProviderId,"True"
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNS,strCampaign,"True"
							wait 5
								
							REM .webList("Grouping").selectItem strGrouping
							REM wait 3
							
							.webEdit("Comments").setValue strComments
							wait 5
							
							.webButton("Generate").press
		
End with	

With ivm.page(reportgen_page)	

							.webLink("PreferredData").press
							wait 4
							
							.webTable("PreferredData_RD").assertExist "True"
							wait 5	
							
                            .webLink("AdvancedSearch").press					
					        wait 3	
							
					        .webEdit("ElementNumber").setValue strElementNumber
							 wait 3
							 
							 webEdit("DeviceID").setValue strDeviceID
							 wait 3
							 
					        .selectListItem MULTI_LIST_PROGRAMPID,strProgramPID,"True"
							
							 wait 3
					        .selectDate reportRawData,"StartDate",START_DATE	
							 wait 3
					        .selectDate reportRawData,"EndDate",END_DATE	
							 wait 3
							
					        .webLink("AdvSearch").press					
					         wait 5
							 
							.webTable("PreferredData_RD").searchData strElementNumber	
							.webTable("PreferredData_RD").searchData strProgramPID	
							.webTable("PreferredData_RD").searchData DeviceID	

							strFromTo= "From " & START_DATE & " to " & END_DATE
					        .webTable("PreferredData_RD").searchData strFromTo
							
					        .webLink("ClearAll_RD").press
					         wait 5
							 
					        .webLink("ClearAll_RD").assertExist "False"	
							
					        .webLink("BackToPreviousPage").press
						    wait 10			
End with

with ivm.page(report_page)

			                .webButton("Cancel").press
					         wait 5
							 
							.webElement("AvailableReports").assertExist "True"
						    .webElement("AvailableReports").assertStatus "Visible"
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateForMultipleSelectionsForSearchFields", "REP_RDR_TC_035"